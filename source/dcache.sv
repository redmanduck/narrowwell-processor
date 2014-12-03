`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

import cpu_types_pkg::*;

module dcache (
		input logic CLK, nRST,
		datapath_cache_if.dcache dpif,
		output logic flushing, 
		output word_t dstore, daddr,
		input word_t snoopaddr,
		output word_t ccwrite, cctrans,
		input logic ccwait, dwait,
		output logic dWEN, dREN,
		input logic ccinv,
		input word_t dload
		);
	parameter total_set = 8;
	parameter way_count = 2;
	parameter CPUID = 0;

	typedef struct packed{
		logic [25:0] tag;
		word_t [1:0] block;
		logic valid;
		logic dirty;
	} CacheRow;

	typedef struct packed{
		CacheRow [total_set - 1 : 0] dtable;
	} CacheWay;


	typedef struct packed{
		word_t addr;
		logic valid;
	} LinkedReg;

	logic [total_set - 1 : 0] LRU;

	CacheWay [1:0] cway;
	LinkedReg linkr;
	LinkedReg next_linkr;

	typedef enum logic [4:0] {
		IDLE, FETCH1, FETCH2, FETCH_FINISHED, 
		WB1, WB2, RESET, FLUSH1, FLUSH2, 
		FLUSH3, FLUSH4, 
		DONE_EVERYTHING, 
		CC_INVALIDATE, CC_WB1, CC_WB2
	} StateType;


	StateType state, next_state;

	logic [25:0] rq_tag, snoop_tag;
	logic [2:0] rq_index, snoop_index;
	logic hit_out, hit0, hit1, snoop_hit, snoop_hit0, snoop_hit1, snoop_way;
	logic tag_match0, tag_match1;
	logic cur_lru, rq_blockoffset, snoop_offset;

	logic FLUSH_INDEX_INCREM_EN;
	logic CACHE_CLEAR;
	logic which_word, write_dirty, write_valid, CACHE_WEN;
	word_t write_data;
	logic [25:0] write_tag;
	dcachef_t snoop_addr;

	//current LRU based on index
	assign cur_lru = LRU[rq_index];
	//requested index and tag
	assign rq_index = dpif.dmemaddr[5:3];
	assign rq_tag = dpif.dmemaddr[31:6];
	assign rq_blockoffset = dpif.dmemaddr[2];

	assign tag_match0 = (rq_tag == cway[0].dtable[rq_index].tag);
	assign tag_match1 = (rq_tag == cway[1].dtable[rq_index].tag);

	assign hit0 = (rq_tag == cway[0].dtable[rq_index].tag) && (cway[0].dtable[rq_index].valid) && (dpif.dmemREN || dpif.dmemWEN);
	assign hit1 = (rq_tag == cway[1].dtable[rq_index].tag) && (cway[1].dtable[rq_index].valid) && (dpif.dmemREN || dpif.dmemWEN);
	assign hit_out = hit0 | hit1;

	assign dpif.dhit = hit_out;

	assign snoop_addr = dcachef_t'(snoopaddr);

	assign snoop_index = snoop_addr.idx; 
	assign snoop_tag = snoop_addr.tag;
	assign snoop_offset = snoop_addr.blkoff;

	assign snoop_hit1 = (cway[1].dtable[snoop_index].tag == snoop_tag) && cway[1].dtable[snoop_index].valid; //hit on cache way 1
	assign snoop_hit0 = (cway[0].dtable[snoop_index].tag == snoop_tag) && cway[0].dtable[snoop_index].valid; //hit on cache way 2
	assign snoop_hit =  snoop_hit1 || snoop_hit0; //its like a hit_out but its a snoop hit
	assign snoop_way = snoop_hit1 ? 1 : 0; //what way did the snoop hit

	CacheRow [1:0] flushset;
	logic [2:0] flush_index;

	assign flushset[0] = cway[0].dtable[flush_index];
	assign flushset[1] = cway[1].dtable[flush_index];

	always_comb begin : next_state_logic_fsm

		next_state = IDLE;
		flushing = 0;     
		if(ccwait && state == IDLE) begin
			next_state = IDLE;
			//dont exit idle if there is a ccwait unless u are invalidating or writing back
			if(snoop_hit && ccwait) begin
				if (ccinv == 1) begin
					//M or S , transition to I

					next_state = CC_INVALIDATE;
        		
				end else if(cway[snoop_way].dtable[snoop_index].dirty) begin
					//there is a snoop hit but we are in modified
					//so we will writeback + send to the other cache
        		
					// this may transition from M->S -- probably
        		
					next_state = CC_WB1; //writeback that snooped block
				end
			end
		end else if(state == IDLE) begin
			/*
			 * ###############  IDLE #################: 
			 * 1. we can get snooped, and may need to transit to do cache writeback ( + c2c) (not normal writeback)
			 * 2. we can get snooped, and are demanded that we CC_INVALIDATE if there is a snoop hit
			 * 3. other non-coherence operations 
			 */
     	
			if (dpif.halt) begin
				next_state = FLUSH1;
				flushing = 1;   
			end else if(!hit_out && dpif.dmemWEN) begin
				next_state = FETCH1; //when you have a cache miss, you should fetch	    	
			end else if(hit_out) begin //&& dpif.dmemREN
				//want to read and its in the table, so we just read it
				next_state = IDLE;
			end else if(!(dpif.dmemREN || dpif.dmemWEN)) begin
				next_state = IDLE;
			end else if((!cway[cur_lru].dtable[rq_index].dirty || (!cway[0].dtable[rq_index].valid && !cway[1].dtable[rq_index].valid)) && !hit_out) begin
				next_state = FETCH1;
			end else if(!hit_out && cway[cur_lru].dtable[rq_index].dirty && cway[cur_lru].dtable[rq_index].valid) begin
				next_state = WB1;
			end 

		end else if(state == CC_INVALIDATE) begin
			/**
			 * ######### CC_INVALIDATE ##########
			 * we CC_INVALIDATE our block
			 */
			next_state = IDLE;
		end else if(state == CC_WB1) begin
			/*
			 * ######## CACHE_WRITEBACK #######
			 * write back and do c2c for the given snoop blk offset 0
			 */
			if(!dwait) begin
				next_state = CC_WB2;
			end else begin
				next_state = CC_WB1;
			end
     	
		end else if(state == CC_WB2) begin
			/*
			 * ######## CACHE_WRITEBACK #######
			 * write back and do c2c for the given snoop blk offset 1
			 */
			if(!dwait) begin
				next_state = IDLE;
			end else begin
				next_state = CC_WB2;
			end
		end else if(state == FLUSH1) begin
			/**
			 * ####### FLUSH ###########
			 * This is a non coherence state where we flush the data off the tables
			 */
			if(!dwait || !flushset[0].dirty) begin
				next_state = FLUSH2;
				flushing = 1; 
			end else begin
				next_state = FLUSH1;
				flushing = 1; 
			end

		end else if(state == FLUSH2) begin
			/**
			 * ####### FLUSH ###########
			 * This is a non coherence state where we flush the data off the tables
			 */
			if(!dwait || !flushset[0].dirty) begin
				next_state = FLUSH3;
				flushing = 1; 
			end else begin
				next_state = FLUSH2;
				flushing = 1; 
			end
		end else if(state == FLUSH3) begin
			/**
			 * ####### FLUSH ###########
			 * This is a non coherence state where we flush the data off the tables
			 */

			if(!dwait || !flushset[1].dirty) begin
				next_state = FLUSH4;
				flushing = 1; 
			end else begin
				next_state = FLUSH3;
				flushing = 1; 
			end

		end else if(state == FLUSH4) begin
			/**
			 * ####### FLUSH ###########
			 * This is a non coherence state where we flush the data off the tables
			 */
			if(!dwait || !flushset[1].dirty) begin
				if(flush_index == total_set -1) begin //done flushing if we flushed 8 rows already
					next_state = DONE_EVERYTHING; //took out hitocunt
					flushing = 0; 
				end else begin
					next_state = FLUSH1;
					flushing = 1; 
				end
			end else begin
				next_state = FLUSH4;
				flushing = 1; 
			end

		end else if(state == DONE_EVERYTHING) begin
			/**
			 * ####### ALL DONE ###########
			 * Dead state when everything is done
			 */
			next_state = DONE_EVERYTHING;

		end else if(state == FETCH_FINISHED) begin
			/**
			 * ####### FETCH DONE ###########
			 * Indicate that a fetch (non coherence) is done
			 */
			next_state = IDLE;

		end else if(state == FETCH1) begin
			/**
			 * ####### FETCH1 ###########
			 * Fetch the first word
			 */
			if(!dwait) begin
				next_state = FETCH2;
			end else begin
				next_state = FETCH1;
			end
		end else if(state == FETCH2) begin
			/**
			 * ####### FETCH2 ###########
			 * Fetch the second word
			 */
     	
			if(!dwait) begin
				next_state = IDLE;
			end else begin
				next_state = FETCH2;
			end
		end else if(state == WB1) begin
			/**
			 * ####### WB1 ###########
			 * Writeback the first word
			 */

			if(dwait) begin
				next_state = WB1;
			end else begin
				next_state = WB2;
			end

		end else if(state == WB2) begin
			/**
			 * ####### WB2 ###########
			 * Writeback the second word
			 */
			if(dwait) begin
				next_state = WB2;
			end else begin
				next_state = FETCH1;
			end

		end else if(state == RESET) begin
			/**
			 * ####### RESET ###########
			 * Just dumbass RESET state
			 */
			next_state = IDLE;
		end
	end

	logic next_lru;
	always_ff @ (posedge CLK, negedge nRST) begin
		if(!nRST) begin
			LRU <= '0; //LRU is initialized to 0
		end else if(hit_out) begin
			LRU[rq_index] <= next_lru; //LRU is switched out for whaterver the LRU should be next
			$display("updating LRU at index %d to %d", rq_index, hit0);
		end
	end

	always_ff @ (posedge CLK, negedge nRST) begin
		if(!nRST) begin
			linkr <= '0;
		end else if(hit_out) begin
			linkr <= next_linkr;
		end
	end

	//assign dpif.dmemload = (hit0 ? cway[0].dtable[rq_index].block[rq_blockoffset] : (hit1 ? cway[1].dtable[rq_index].block[rq_blockoffset] : 32'hbad1bad2 ));

	logic SC_SUCCESS;
	always_comb begin: data_return_to_core
		if(dpif.datomic && dpif.dmemWEN) begin
			//Store conditonal
			dpif.dmemload = {31'h0, SC_SUCCESS}; 
		end if(hit0 == 1) begin
			//If there is a hit on way 0
			if(rq_blockoffset == 0) begin //and for block offset 0
				dpif.dmemload = cway[0].dtable[rq_index].block[0:0]; //we load that
			end else begin      								     //otherwise
				dpif.dmemload = cway[0].dtable[rq_index].block[1:1]; //we load the other one
			end
		end else if(hit1 == 1) begin    //same but different
			if(rq_blockoffset == 0) begin
				dpif.dmemload = cway[1].dtable[rq_index].block[0:0];
			end else begin
				dpif.dmemload = cway[1].dtable[rq_index].block[1:1];
			end
		end else begin
			dpif.dmemload = 32'hbad0bad0;
		end
	end

 
	/*
	 *  State machine
	 *  Output logics
	 */
 
	always_comb begin : output_logic_fsm
		CACHE_WEN = 0;
		CACHE_CLEAR = 0;
		// ccif.dREN = 0;
		// ccif.dWEN = 0;

		// which_word = 0;
		// write_dirty = 0;
		// write_valid = 0;
		// write_tag = 0;
		// write_data = 0;
		dpif.flushed = 0;
		next_lru = LRU[rq_index];
		FLUSH_INDEX_INCREM_EN = 0;
  	    SC_SUCCESS = 0;
		ccwrite = 0; 
		cctrans = 0; //assert cctrans when there is an MSI upgrade

		/* Experimental */
    //	dstore = '0;  
   // 	daddr = '0;

    	next_linkr = linkr;  

    	/* End Experiment */

		casez(state)
			CC_WB1: begin
				/*
				 * ##### CACHE writeback 1 #######
				 */
				//the block must've been in M state
      			which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;

				dREN = 0;
				dWEN = 1;
				daddr = { snoop_tag, snoop_index, 3'b000};
				dstore = cway[snoop_way].dtable[snoop_index].block[0:0]; 
        
				ccwrite = 0; 
        
			end
			CC_WB2: begin
				/*
				 * ##### CACHE writeback 2 #######
				 */	
				//writing back part
				dREN = 0;
				dWEN = 1;
				daddr = { snoop_tag, snoop_index, 3'b100};
				dstore = cway[snoop_way].dtable[snoop_index].block[1:1]; 
      	
				// the current block (both words) to be no longer dirty
				which_word = 0; //dont matter , just be consistent
		
				write_dirty = 0; 
				write_valid = 1; // M -> S
        
				write_tag = snoop_tag; 
				write_data = cway[snoop_way].dtable[snoop_index].block[0:0]; //we said word 0
        
				FLUSH_INDEX_INCREM_EN = 0;
				CACHE_WEN = 1;
				ccwrite = 0; 
				cctrans = 0; //downgrade transition 
			end
			FLUSH1: begin
				/*
				 * ##### FLUSH 1 #######
				 */
				//This flushes WAY 1, LOWER WORD at whaterver index we are at
				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;
				FLUSH_INDEX_INCREM_EN = 0;
				CACHE_WEN = 0;
				dREN = 0;
				dWEN = flushset[0].dirty;

				dstore = flushset[0].block[0]; //lower word
				daddr = { flushset[0].tag, flush_index, 1'b0 ,2'b00};

				//$display("FLUSHING 1 : idx = %h, data = %h, dirty = %h, addr = %h", flush_index, flushset[0].block[0], flushset[0].dirty, { flushset[0].tag, flush_index, 1'b0 ,2'b00});

			end
			FLUSH2: begin
				/*
				 * ##### FLUSH 2 #######
				 */
				//This flushes WAY 2, UPPER WORD at whaterver index we are at
				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;
				CACHE_WEN = 0;
				FLUSH_INDEX_INCREM_EN = 0;
				dREN = 0;
				dWEN = flushset[0].dirty;
				dstore = flushset[0].block[1]; //upper word
				daddr = { flushset[0].tag, flush_index, 1'b1 ,2'b00};

				//$display("FLUSHING 2 : idx = %h, data = %h, dirty = %h, addr = %h", flush_index, flushset[0].block[1], flushset[0].dirty, { flushset[0].tag, flush_index, 1'b1 ,2'b00});

				//TODO we need to write hit count to memory
			end
			FLUSH3: begin
				/*
				 * ##### FLUSH3 #######
				 */
				//This flushes WAY 2, LOWER WORD at whaterver index we are at
				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;
				FLUSH_INDEX_INCREM_EN = 0;
				CACHE_WEN = 0;
				dREN = 0;
				dWEN = flushset[1].dirty;

				dstore = flushset[1].block[0]; //lower word
				daddr = { flushset[1].tag, flush_index, 1'b0 ,2'b00};

				//$display("FLUSHING 3 : idx = %h, data = %h, dirty = %h, addr = %h", flush_index, flushset[1].block[0], flushset[1].dirty, { flushset[1].tag, flush_index, 1'b0 ,2'b00});


			end
			FLUSH4: begin
				/*
				 * ##### FLUSH 4 #######
				 */
				//This flushes WAY 2, UPPER WORD at whaterver index we are at
				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;
				CACHE_WEN = 0;
				FLUSH_INDEX_INCREM_EN = 1; //increment to the next index
				dREN = 0;
				dWEN = flushset[1].dirty;
				dstore = flushset[1].block[1]; //upper word
				daddr = { flushset[1].tag, flush_index, 1'b1 ,2'b00};

				//$display("FLUSHING 4 : idx = %h, data = %h, dirty = %h, addr = %h \n", flush_index, flushset[1].block[1], flushset[1].dirty, { flushset[1].tag, flush_index, 1'b1 ,2'b00});

			end
			DONE_EVERYTHING: begin
				/*
				 * ##### DONE EVERTHING #######
				 */
				dpif.flushed = 1; //signal the processor that we are done 
				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				CACHE_CLEAR = 1;
				CACHE_WEN = 0;
				write_data = 0;    
				dREN = 0;
				dWEN = 0;
		    	dstore = '0;  
		    	daddr = '0;
			end
			CC_INVALIDATE: begin
				/*
				 * ##### (CC) CC_INVALIDATE #######
				 */
				//set the valid bit false for the cache block being snooped
      			dstore = '0;  
    			daddr = '0;
				cctrans = 0;  //we dont need to tell other cache anything
      			dREN = 0;
				dWEN = 0;
				dpif.flushed = 0;
				CACHE_WEN = 1;
				which_word = snoop_offset;
				write_dirty = 0; //go from M -> I or S-> I
				write_valid = 0;
				write_tag = snoop_tag;
				write_data = 'hFBFBFBFB;

				if(dpif.dmemaddr == linkr.addr) begin
					next_linkr = '0; //clear link
				end
					

			end
			IDLE: begin
				/*
				 * ############### IDLE ###########
				 */
				dREN = 0;
				dWEN = 0;
				daddr = '0;
      			dstore = '0;  

				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;
				if(dpif.datomic) begin
					if(dpif.dmemREN) begin : LL
						//Load Link
						next_linkr.addr = dpif.dmemaddr;
						next_linkr.valid = 1;
					end else if (dpif.dmemWEN) begin : SC
						//Store conditional
						if(linkr.valid && (dpif.dmemaddr == linkr.addr)) begin
							SC_SUCCESS = 1;
							next_linkr = '0; //clear link
						end else begin
							SC_SUCCESS = 0;
							next_linkr = '0; //clear link
						end
					end
				end 

				if(hit_out) begin
					next_lru = hit0;

					if(dpif.dmemWEN == 1'b1) begin
						/*if(dpif.dmemaddr == linkr.addr) begin
							//invalidate lock if there is a modification to
							//that address by a non-atomic operation
							next_linkr = '0;
						end*/
						//while sitting in cache
						//and there is a hit
						//and there is a write
						next_lru = !LRU[rq_index]; //?
                    
						FLUSH_INDEX_INCREM_EN = 0;
						

						which_word = rq_blockoffset;
						write_dirty = 1;
						write_valid = 1;
						write_tag = rq_tag;
						write_data = dpif.dmemstore;
                    
						if(dpif.datomic && !linkr.valid) begin
							//SC lock was broken
							//dont store
							CACHE_WEN = 0;
							ccwrite = 0;
							cctrans = 0; 
						end else begin
							ccwrite = 1; 
	               			CACHE_WEN = 1;
							//if upgrade from S -> M , cctrans
							if(cway[!hit0].dtable[rq_index].valid && !cway[!hit0].dtable[rq_index].dirty) begin
								cctrans = 1; 
							end else if(!cway[!hit0].dtable[rq_index].valid) begin
								//if upgrade from I -> M
								cctrans = 1;
							end else begin
								//all other cases
								cctrans = 0; 
							end
						end
					end

				end else begin
					dREN = 0;
					dWEN = 0;
					CACHE_WEN = 0;
					which_word = 0;
					write_dirty = 0;
					write_valid = 0;
					write_tag = 0;
					write_data = 0;
					cctrans = 0;
					FLUSH_INDEX_INCREM_EN  = 0;
				end


			

				// if(hit_out) begin
				//     LRU[rq_index] = !LRU[rq_index];
				// end

			end
			FETCH1: begin
				/*
				 * ############### FETCH 1 ###########
				 * Fetch data from memory for word 0
				 */
				dREN = 1;
				dWEN = 0;
      			dstore = '0;  

				CACHE_WEN = 1;
				which_word = 0;
				write_dirty = 0;
				write_tag = rq_tag;
				write_valid = 0;
				write_data = dload;
          
				cctrans = 0; 

				FLUSH_INDEX_INCREM_EN  = 0;
				daddr = {rq_tag, rq_index, 3'b000};
          
				//send out cctrans because we are transitioning from I to S
          
				//TODO: not sure about cur_lru used here?? Why do we need cctrans when going from I to S , who cares
		   		if(!cway[cur_lru].dtable[rq_index].valid) begin 
					cctrans = 1; 
				end else begin
					cctrans = 0;
				end

			end
			FETCH2: begin
				/*
				 * ############### FETCH 2 ###########
				 * Fetch data from memory for word 1- because we missed or someshit
				 */
      			dstore = '0;  

				dREN = 1;
				dWEN = 0;
				CACHE_WEN = 1;
				which_word = 1;
				write_dirty = 0;
				write_tag = rq_tag;
				write_data = dload;
			
				//reconstruct the address from the tags 
				daddr = {rq_tag, rq_index, 3'b100};

				FLUSH_INDEX_INCREM_EN  = 0;  
          		cctrans = 0;
          		
				//Don't set write valid bit we finish writing
				if(!dwait) begin
					write_valid = 1;
				end else begin
					write_valid = 0;
				end
          
				//TODO: not sure about cur_lru used here??
			    if(!cway[cur_lru].dtable[rq_index].valid) begin 
					cctrans = 1; 
				end else begin
					cctrans = 0;
				end
	
				//TODO: not sure why this is here? is there a case where we need this? isnt this redundant?
				if(hit_out && dpif.dmemWEN) begin
					$display("FETCH2 WRITING CACHE: LRU = %d, IDX = %d, data = %h", cur_lru, rq_index, dpif.dmemstore);
				
					FLUSH_INDEX_INCREM_EN  = 0;
					CACHE_WEN = 1;
					write_dirty = 1;
					write_valid = 1;
                
                
					ccwrite = 1; 
           
					which_word = rq_blockoffset;
					write_data = dpif.dmemstore;
					write_tag = rq_tag;

				end


			end
			WB1: begin
				/*
				 * ############### WRITEBACK ###########
				 * On eviction or something like that
				 * write the block back to RAM 
				 */

				CACHE_WEN = 0;
				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;
				//reconstruct address from table record
				daddr = {cway[cur_lru].dtable[rq_index].tag, rq_index, 3'b000};

				FLUSH_INDEX_INCREM_EN  = 0;
				dWEN = 1;
				dREN = 0;
				dstore = cway[cur_lru].dtable[rq_index].block[0:0]; //cur_lru ---> (hit0 ? 1 : 0)

				//TODO : double check with evillase
				cctrans = 0; //this is a MSI downgrade 
          
			end
			WB2: begin
				/*
				 * ############### WRITEBACK ###########
				 * On eviction or some shit, write the block back to vm
				 */
				//writeback data in table to RAM
      	
				CACHE_WEN = 0;

				which_word = 0;
				write_dirty = 0;
				write_valid = 0;
				write_tag = 0;
				write_data = 0;

				FLUSH_INDEX_INCREM_EN  = 0;
				daddr = {cway[cur_lru].dtable[rq_index].tag, rq_index, 3'b100};
				dWEN = 1;
				dREN = 0;
				dstore = cway[cur_lru].dtable[rq_index].block[1:1]; //(hit0 ? 1 : 0)

				//TODO : double check with evillase
				cctrans = 0; //this is a MSI downgrade 
          
			end
			default: begin
				$display("entered default");
				CACHE_WEN = 0;
				//dont do anything
				dREN = 0;
				dWEN = 0;
				dpif.flushed = 0;
				daddr = '0;
      			dstore = '0;  

				FLUSH_INDEX_INCREM_EN  = 0;
				write_dirty = 0;
				write_valid = 0;
				which_word = 0;
				write_data = 0;
				write_tag = 0;
				cctrans = 0;
			end
		endcase
	end

	/**
	 * Table Update logics
	 */

	always_ff @ (posedge CLK, negedge nRST) begin : cache_fsm
		if(!nRST) begin
			cway <= '0;
		end else if(CACHE_WEN) begin
			if(hit_out) begin
				cway[!hit0].dtable[rq_index].tag <= write_tag;
				cway[!hit0].dtable[rq_index].block[which_word] <= write_data;
				cway[!hit0].dtable[rq_index].valid <= write_valid;
				cway[!hit0].dtable[rq_index].dirty <= write_dirty;
			end else begin
				cway[cur_lru].dtable[rq_index].tag <= write_tag;
				cway[cur_lru].dtable[rq_index].block[which_word] <= write_data;
				cway[cur_lru].dtable[rq_index].valid <= write_valid;
				cway[cur_lru].dtable[rq_index].dirty <= write_dirty;
			end
		end else if(CACHE_CLEAR) begin
			cway <= '0;
		end
	end

	always_ff @ (posedge CLK, negedge nRST) begin: flush_fsm
		if(!nRST) begin
			flush_index <= 0;
		end else if(FLUSH_INDEX_INCREM_EN) begin
			flush_index <= flush_index + 1;
		end
	end

	always_ff @ (posedge CLK, negedge nRST) begin : ff_fsm
		if(!nRST) begin
			state <= IDLE;
		end else begin //don't transition on ccwait - pause 
			state <= next_state;
		end
	end

endmodule

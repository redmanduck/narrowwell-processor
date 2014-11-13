`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

import cpu_types_pkg::*;

module dcache (
  input logic CLK, nRST,
  datapath_cache_if.dcache dpif,
  cache_control_if.dcache ccif
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

  logic [total_set - 1 : 0] LRU;

  CacheWay [1:0] cway;

  typedef enum logic [4:0] {
    IDLE, FETCH1, FETCH2, FETCH_FINISHED, 
    WB1, WB2, RESET, flush1, flush2, 
    flush3, flush4, ALL_FLUSHED, 
    DONE_EVERYTHING, 
    CC_INVALIDATE, CC_WB1, CC_WB2
  } StateType;


  StateType state, next_state;

  logic [25:0] rq_tag, snoop_tag;
  logic [2:0] rq_index, snoop_index;
  logic hit_out, hit0, hit1, snoop_hit, snoop_hit0, snoop_hit1, snoop_way;
  logic tag_match0, tag_match1;
  logic cur_lru, rq_blockoffset, snoop_offset;

  word_t hitcount, hitcount_next;
  word_t hit_wait_count, hit_wait_count_next;

  logic FLUSH_INDEX_INCREM_EN;
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

  assign snoop_addr = dcachef_t'(ccif.ccsnoopaddr);

  assign snoop_index = snoop_addr.idx; 
  assign snoop_tag = snoop_addr.tag;
  assign snoop_offset = snoop_addr.blkoff;

  assign snoop_hit1 = (cway[1].dtable[snoop_index].tag == snoop_tag) && cway[1].dtable[snoop_index].valid; //hit on cache 1
  assign snoop_hit0 = (cway[0].dtable[snoop_index].tag == snoop_tag) && cway[0].dtable[snoop_index].valid; //hit on cache 2
  assign snoop_hit =  snoop_hit1 || snoop_hit0; //its like a hit_out but its a snoop hit
  assign snoop_way = snoop_hit1 ? 1 : 0; //what way did the snoop hit

  CacheRow [1:0] flushset;
  logic [2:0] flush_index;

  assign flushset[0] = cway[0].dtable[flush_index];
  assign flushset[1] = cway[1].dtable[flush_index];

  always_comb begin : next_state_logic_fsm

     next_state = IDLE;
     
     if(state == IDLE) begin
     	/*
     	 * ###############  IDLE #################: 
     	 * 1. we can get snooped, and may need to transit to do cache writeback ( + c2c) (not normal writeback)
     	 * 2. we can get snooped, and are demanded that we CC_INVALIDATE if there is a snoop hit
     	 * 3. other non-coherence operations 
     	 */
     	

        if (dpif.halt) begin
            next_state = flush1;
        end else if(snoop_hit) begin
        	if (ccif.ccinv[CPUID] == 1) begin
        		//M or S , transition to I

        		next_state = CC_INVALIDATE;
        		
        	end else if(cway[snoop_way].dtable[snoop_index].tag == snoop_tag && cway[snoop_way].dtable[snoop_index].dirty) begin
        		//there is a snoop hit but we are in modified
        		//so we will writeback + send to the other cache
        		
        		// this may transition from M->S -- probably
        		
        		next_state = CC_WB1; //writeback that snooped block
        	end

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
     	if(!ccif.dwait[CPUID]) begin
     		next_state = CC_WB2;
     	end else begin
     		next_state = CC_WB1;
     	end
     	
     end else if(state == CC_WB2) begin
     	/*
     	 * ######## CACHE_WRITEBACK #######
     	 * write back and do c2c for the given snoop blk offset 1
     	 */
     	if(!ccif.dwait[CPUID]) begin
     		next_state = IDLE;
     	end else begin
     		next_state = CC_WB2;
     	end
     end else if(state == flush1) begin
     	/**
     	 * ####### FLUSH ###########
     	 * This is a non coherence state where we flush the data off the tables
     	 */
        if(!ccif.dwait[CPUID] || !flushset[1].dirty) begin
          next_state = flush2;
        end else begin
           next_state = flush1;
        end

     end else if(state == flush2) begin
      	/**
     	 * ####### FLUSH ###########
     	 * This is a non coherence state where we flush the data off the tables
     	 */
        if(!ccif.dwait[CPUID] || !flushset[0].dirty) begin
           next_state = flush3;
        end else begin
           next_state = flush2;
        end
     end else if(state == flush3) begin
     	/**
     	 * ####### FLUSH ###########
     	 * This is a non coherence state where we flush the data off the tables
     	 */

     	if(!ccif.dwait[CPUID] || !flushset[1].dirty) begin
          next_state = flush4;
        end else begin
           next_state = flush3;
        end

     end else if(state == flush4) begin
       	/**
     	 * ####### FLUSH ###########
     	 * This is a non coherence state where we flush the data off the tables
     	 */
        if(!ccif.dwait[CPUID] || !flushset[0].dirty) begin
           if(flush_index == total_set -1) begin //done flushing if we flushed 8 rows already
              next_state = ALL_FLUSHED;
           end else begin
              next_state = flush1;
           end
        end else begin
           next_state = flush4;
        end

    end else if(state == ALL_FLUSHED) begin
    	 /**
     	 * ####### ALL_FLUSHED ###########
     	 * Indicates that all flush are finished and appropriate signal are sent back
     	 */
        if(!ccif.dwait[CPUID]) begin //wait for RAM
          next_state = DONE_EVERYTHING;
        end else begin
          next_state = ALL_FLUSHED;
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
        if(ccif.dwait[CPUID]) begin
          next_state = FETCH1;
        end else begin
          next_state = FETCH2;
        end
     end else if(state == FETCH2) begin
     	 /**
     	 * ####### FETCH2 ###########
     	 * Fetch the second word
     	 */
        if(ccif.dwait[CPUID]) begin
          next_state = FETCH2;
        end else begin
          next_state = IDLE;
        end
     end else if(state == WB1) begin
     	 /**
     	 * ####### WB1 ###########
     	 * Writeback the first word
     	 */

        if(ccif.dwait[CPUID]) begin
            next_state = WB1;
        end else begin
            next_state = WB2;
        end

     end else if(state == WB2) begin
     	 /**
     	 * ####### WB2 ###########
     	 * Writeback the second word
     	 */
        if(ccif.dwait[CPUID]) begin
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

 //assign dpif.dmemload = (hit0 ? cway[0].dtable[rq_index].block[rq_blockoffset] : (hit1 ? cway[1].dtable[rq_index].block[rq_blockoffset] : 32'hbad1bad2 ));

 always_comb begin: Eric
   if(hit0 == 1) begin
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
    // ccif.dREN = 0;
    // ccif.dWEN = 0;

    // which_word = 0;
    // write_dirty = 0;
    // write_valid = 0;
    // write_tag = 0;
    // write_data = 0;
    // dpif.flushed = 0;
    hitcount_next = hitcount;
    hit_wait_count_next = hit_wait_count + 1;
    next_lru = LRU[rq_index];
    FLUSH_INDEX_INCREM_EN = 0;
  
    ccif.ccwrite[CPUID] = 0; 
	ccif.cctrans[CPUID] = 0; //assert cctrans when there is an MSI upgrade
    
    casez(state)
      CC_WB1: begin
      	/*
      	 * ##### CACHE writeback 1 #######
      	 */
		//the block must've been in M state
      	
      	ccif.dREN[CPUID] = 0;
		ccif.dWEN[CPUID] = 1;
		ccif.daddr[CPUID] = { snoop_tag, snoop_index, 3'b000};
		ccif.dstore[CPUID] = cway[snoop_way].dtable[snoop_index].block[0:0]; 
        ccif.ccwrite[CPUID] = 1;
        
        
      end
      CC_WB2: begin
      	/*
      	 * ##### CACHE writeback 2 #######
     	 */	
      	//writing back part
      	ccif.dREN[CPUID] = 0;
      	ccif.dWEN[CPUID] = 1;
      	ccif.daddr[CPUID] = { snoop_tag, snoop_index, 3'b100};
      	ccif.dstore[CPUID] = cway[snoop_way].dtable[snoop_index].block[1:1]; 
      	ccif.ccwrite[CPUID] = 1;      	// the current block to be no longer dirty
      	
      	// the current block (both words) to be no longer dirty
		which_word = 0; //dont matter , just be consistent
		
        write_dirty = 0; 
        write_valid = 1; // M -> S
        
        write_tag = snoop_tag; 
        write_data = cway[snoop_way].dtable[snoop_index].block[0:0]; //we said word 0
        
        FLUSH_INDEX_INCREM_EN = 0;
        CACHE_WEN = 1;

        ccif.cctrans[CPUID] = 0; //downgrade transition 
		        
      end
      flush1: begin
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
          ccif.dREN[CPUID] = 0;
          ccif.dWEN[CPUID] = flushset[0].dirty;

          ccif.dstore[CPUID] = flushset[0].block[0]; //lower word
          ccif.daddr[CPUID] = { flushset[0].tag, flush_index, 1'b0 ,2'b00};

          //$display("FLUSHING 1 : idx = %h, data = %h, dirty = %h, addr = %h", flush_index, flushset[0].block[0], flushset[0].dirty, { flushset[0].tag, flush_index, 1'b0 ,2'b00});

      end
      flush2: begin
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
          ccif.dREN[CPUID] = 0;
          ccif.dWEN[CPUID] = flushset[0].dirty;
          ccif.dstore[CPUID] = flushset[0].block[1]; //upper word
          ccif.daddr[CPUID] = { flushset[0].tag, flush_index, 1'b1 ,2'b00};

          //$display("FLUSHING 2 : idx = %h, data = %h, dirty = %h, addr = %h", flush_index, flushset[0].block[1], flushset[0].dirty, { flushset[0].tag, flush_index, 1'b1 ,2'b00});

          //TODO we need to write hit count to memory
      end
      flush3: begin
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
          ccif.dREN[CPUID] = 0;
          ccif.dWEN[CPUID] = flushset[1].dirty;

          ccif.dstore[CPUID] = flushset[1].block[0]; //lower word
          ccif.daddr[CPUID] = { flushset[1].tag, flush_index, 1'b0 ,2'b00};

          //$display("FLUSHING 3 : idx = %h, data = %h, dirty = %h, addr = %h", flush_index, flushset[1].block[0], flushset[1].dirty, { flushset[1].tag, flush_index, 1'b0 ,2'b00});


      end
      flush4: begin
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
          ccif.dREN[CPUID] = 0;
          ccif.dWEN[CPUID] = flushset[1].dirty;
          ccif.dstore[CPUID] = flushset[1].block[1]; //upper word
          ccif.daddr[CPUID] = { flushset[1].tag, flush_index, 1'b1 ,2'b00};

          //$display("FLUSHING 4 : idx = %h, data = %h, dirty = %h, addr = %h \n", flush_index, flushset[1].block[1], flushset[1].dirty, { flushset[1].tag, flush_index, 1'b1 ,2'b00});

      end

      ALL_FLUSHED: begin
           /*
      	   * ##### ALL FLUSHED #######
      	   * All flushing activities are done
      	   */
          $display("ALL DONE with hitcount %d", hitcount);
          ccif.dREN[CPUID] = 0;
          ccif.dWEN[CPUID] = 1; //turn this off if you dont want to write hit count
          ccif.dstore[CPUID] = hitcount;
          ccif.daddr[CPUID] = 32'h3100; //thats where we write hit count to 
          CACHE_WEN = 0;

          which_word = 0;
          write_dirty = 0;
          write_valid = 0;
          write_tag = 0;
          write_data = 0;

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
          write_data = 0;      
      end
      CC_INVALIDATE: begin
      	  /*
      	  * ##### (CC) CC_INVALIDATE #######
      	  */
      	  //set the valid bit false for the cache block being snooped
      	
      	  ccif.cctrans[CPUID] = 0;  //we dont need to tell other cache anything
      	
          dpif.flushed = 0;
          CACHE_WEN = 1;
          which_word = snoop_offset;
          write_dirty = 0; //go from M -> I or S-> I
          write_valid = 0;
          write_tag = snoop_tag;
          write_data = 'hFBFBFBFB;
      end
      IDLE: begin
      	  /*
      	   * 
      	   * 
      	   * ############### IDLE ###########
      	   */
            ccif.dREN[CPUID] = 0;
            ccif.dWEN[CPUID] = 0;
            hit_wait_count_next = 0;

            if(hit_out) begin
                next_lru = hit0;

                if(hit_wait_count < 1) begin
                    hitcount_next = hitcount + 1;
                end

                if(dpif.dmemWEN == 1'b1) begin
					//while sitting in cache
                	//and there is a hit
                	//and there is a write
                    next_lru = !LRU[rq_index]; //?
                    
                    FLUSH_INDEX_INCREM_EN = 0;
                    CACHE_WEN = 1;

                    which_word = rq_blockoffset;
                    write_dirty = 1;
                    write_valid = 1;
                    write_tag = rq_tag;
                    write_data = dpif.dmemstore;
                    
                    //if upgrade from S -> M , cctrans
                    if(cway[!hit0].dtable[rq_index].valid && !cway[!hit0].dtable[rq_index].dirty) begin
                    	ccif.cctrans[CPUID] = 1; 
                    end else if(!cway[!hit0].dtable[rq_index].valid) begin
                    	//if upgrade from I -> M
                    	ccif.cctrans[CPUID] = 1;
                    end else begin
                    	//all other cases
                    	ccif.cctrans[CPUID] = 0; 
                    end
                end

            end else begin

                CACHE_WEN = 0;
                which_word = 0;
                write_dirty = 0;
                write_valid = 0;
                write_tag = 0;
                write_data = 0;
				ccif.cctrans[CPUID] = 0;
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
          ccif.dREN[CPUID] = 1;
          ccif.dWEN[CPUID] = 0;
          CACHE_WEN = 1;
          which_word = 0;
          write_dirty = 0;
          write_tag = rq_tag;
          write_valid = 0;
          write_data = ccif.dload[CPUID];
          
          ccif.cctrans[CPUID] = 0; 

          FLUSH_INDEX_INCREM_EN  = 0;
          ccif.daddr[CPUID] = {rq_tag, rq_index, 3'b000};
          
          //send out cctrans because we are transitioning from I to S
          
          //TODO: not sure about cur_lru used here??
          if(!cway[cur_lru].dtable[rq_index].valid) begin 
          	ccif.cctrans[CPUID] = 1; 
          end else begin
          	ccif.cctrans[CPUID] = 0;
          end

      end
      FETCH2: begin
           /*
      	   * ############### FETCH 2 ###########
      	   * Fetch data from memory for word 1- because we missed or someshit
      	   */
          ccif.dREN[CPUID] = 1;
          ccif.dWEN[CPUID] = 0;
          CACHE_WEN = 1;
          which_word = 1;
          write_dirty = 0;
          write_tag = rq_tag;
          write_data = ccif.dload[CPUID];
			
          //reconstruct the address from the tags 
          ccif.daddr[CPUID] = {rq_tag, rq_index, 3'b100};

          FLUSH_INDEX_INCREM_EN  = 0;  
          
          //Dont set write valid bit we finish writing
          if(!ccif.dwait[CPUID]) begin
            write_valid = 1;
          end else begin
            write_valid = 0;
          end
          
          //TODO: not sure about cur_lru used here??
          if(!cway[cur_lru].dtable[rq_index].valid) begin 
          	ccif.cctrans[CPUID] = 1; 
          end else begin
          	ccif.cctrans[CPUID] = 0;
          end
	
          //TODO: not sure why this is here? is there a case where we need this? isnt this redundant?
          if(hit_out && dpif.dmemWEN) begin
                $display("FETCH2 WRITING CACHE: LRU = %d, IDX = %d, data = %h", cur_lru, rq_index, dpif.dmemstore);
				
                FLUSH_INDEX_INCREM_EN  = 0;
                CACHE_WEN = 1;
                write_dirty = 1;
                write_valid = 1;
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
          ccif.daddr[CPUID] = {cway[cur_lru].dtable[rq_index].tag, rq_index, 3'b000};

          FLUSH_INDEX_INCREM_EN  = 0;
          ccif.dWEN[CPUID] = 1;
          ccif.dREN[CPUID] = 0;
          ccif.dstore[CPUID] = cway[cur_lru].dtable[rq_index].block[0:0]; //cur_lru ---> (hit0 ? 1 : 0)

          //TODO : double check with evillase
          ccif.cctrans[CPUID] = 0; //this is a MSI downgrade 
          
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
          ccif.daddr[CPUID] = {cway[cur_lru].dtable[rq_index].tag, rq_index, 3'b100};
          ccif.dWEN[CPUID] = 1;
          ccif.dREN[CPUID] = 0;
          ccif.dstore[CPUID] = cway[cur_lru].dtable[rq_index].block[1:1]; //(hit0 ? 1 : 0)

          //TODO : double check with evillase
          ccif.cctrans[CPUID] = 0; //this is a MSI downgrade 
          
      end
      default: begin
        $display("entered default");
        CACHE_WEN = 0;
        //dont do anything
        ccif.dREN[CPUID] = 0;
        ccif.dWEN[CPUID] = 0;
        dpif.flushed = 0;
        hitcount_next = hitcount;

        FLUSH_INDEX_INCREM_EN  = 0;
        write_dirty = 0;
        write_valid = 0;
        which_word = 0;
        write_data = 0;
        write_tag = 0;
        ccif.cctrans[CPUID] = 0;
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
        hitcount <= 0;
        hit_wait_count <= 0;
    end else if(!ccif.ccwait[CPUID]) begin //don't transition on ccwait - pause 
        state <= next_state;
        hitcount <= hitcount_next;
        hit_wait_count <= hit_wait_count_next;
    end
  end

endmodule

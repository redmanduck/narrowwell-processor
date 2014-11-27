// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
// type import
import cpu_types_pkg::*;

// number of cpus for cc
parameter CPUS = 2;
parameter CPUID = 0;

typedef enum {IDLE, ARBITRATE, SNOOP0, SNOOP1, PRE_WB0, PRE_WB1, 
	WB0, WB1, FETCH0, FETCH1, 
	SNOOP_WT0_A, SNOOP_WT0_B, SNOOP_WT0_C, SNOOP_WT0_D,
	SNOOP_WT1_A, SNOOP_WT1_B, SNOOP_WT1_C, SNOOP_WT1_D} u_state;

u_state next_state, state;

logic [1:0] busRdX, busRd;
assign busRdX[0] = ccif.cctrans[0] && ccif.ccwrite[0];
assign busRd[0] = ccif.cctrans[0] && !ccif.ccwrite[0];
assign busRdX[1] = ccif.cctrans[1] && ccif.ccwrite[1];
assign busRd[1] = ccif.cctrans[1] && !ccif.ccwrite[1];

always_comb begin : NEXT_STATE
  casez(state) 
    IDLE: begin
      if(ccif.flushing[0] || ccif.flushing[1]) begin
    	//if there is a flushing operation we just wait calmly in idle
      	next_state <= IDLE;
      end else if(ccif.cctrans[0] || ccif.cctrans[1]) begin
        //there is a coherency stuff going on
        next_state <= ARBITRATE;
      end else if (!(ccif.dWEN[0] || ccif.dWEN[1])) begin //
        next_state <= IDLE;
      end 
    end
    ARBITRATE: begin 
      if(ccif.dWEN[0] || ccif.dREN[0]) begin
        next_state <= SNOOP0; //snoop cache 1 
      end else if (ccif.dREN[1] || ccif.dWEN[1]) begin
        next_state <= SNOOP1; //snoop cache 0
      end else begin
        next_state <= IDLE;
      end
    end
    SNOOP0: begin
      if(ccif.dWEN[1]) begin
        //if cache 0 WEN went low, its done, move on
        next_state <= PRE_WB0; 
      end else begin
        //wait 
      	next_state <= SNOOP_WT0_A;
      end
    end
    SNOOP_WT0_A: begin
    	/*
    	 * Wait for dWEN , if we snoop and the other cache dont respond (with dWEN) we know to move on to fetch
    	 */
    	if(ccif.dWEN[1]) begin
    		next_state <= PRE_WB0;
    	end else begin
    		next_state <= SNOOP_WT0_B; 
    	end
    end
    SNOOP_WT0_B: begin
    	/*
    	 * second wait cycle after SNOOP_WT0_A
    	 */
    	if(ccif.dWEN[1]) begin
    		next_state <= PRE_WB0;
    	end else begin
    		next_state <= SNOOP_WT0_C; 
    	end
    end
    SNOOP_WT0_C: begin
    	/*
    	 * 3rd wait cycle after SNOOP_WT0_A
    	 */
    	if(ccif.dWEN[1]) begin
    		next_state <= PRE_WB0;
    	end else begin
    		next_state <= SNOOP_WT0_D; 
    	end
    end
    SNOOP_WT0_D: begin
    	/*
    	 * 4th wait cycle after SNOOP_WT0_A
    	 */
    	if(ccif.dWEN[1]) begin
    		next_state <= PRE_WB0;
    	end else begin
    		next_state <= FETCH0; 
    	end
    end
    SNOOP_WT1_A: begin
    	/*
    	 * Wait for dWEN , if we snoop and the other cache dont respond (with dWEN) we know to move on to fetch
    	 */
    	if(ccif.dWEN[0]) begin
    		next_state <= PRE_WB1;
    	end else begin
    		next_state <= SNOOP_WT1_B; 
    	end
    end
    SNOOP_WT1_B: begin
    	/*
    	 * second wait cycle after SNOOP_WT0_B
    	 */
    	if(ccif.dWEN[0]) begin
    		next_state <= PRE_WB1;
    	end else begin
    		next_state <= SNOOP_WT1_C; 
    	end
    end
    SNOOP_WT1_C: begin
    	/*
    	 * 3rd wait cycle after SNOOP_WT0_B
    	 */
    	if(ccif.dWEN[0]) begin
    		next_state <= PRE_WB1;
    	end else begin
    		next_state <= SNOOP_WT1_D; 
    	end
    end
    SNOOP_WT1_D: begin
    	/*
    	 * 4th wait cycle after SNOOP_WT0_B
    	 */
    	if(ccif.dWEN[0]) begin
    		next_state <= PRE_WB1;
    	end else begin
    		next_state <= FETCH1; 
    	end
    end
    SNOOP1: begin
      if(ccif.dWEN[0]) begin
        //if cache 0 WEN went low, its done, move on
        next_state <= PRE_WB1; 
      end else begin
        //wait 
        next_state <= SNOOP_WT1_A;
      end
    end
    PRE_WB0: begin
      if(!ccif.dwait[1] ) begin
        next_state <= WB0; //move forward when cache 0 is done
      end else begin
        next_state <= PRE_WB0; //wait
      end
    end
    PRE_WB1: begin
      if(!ccif.dwait[0] ) begin
        next_state <= WB1; //move forward when cache 0 is done
      end else begin
        next_state <= PRE_WB1; //wait
      end
    end
    FETCH0: begin
      if(!ccif.dwait[0]) begin
        //Done fetch
        next_state <= IDLE;
      end else begin
        next_state <= FETCH0;
      end
    end
    FETCH1: begin
      if(!ccif.dwait[1]) begin
        //Done fetch
        next_state <= IDLE;
      end else begin
        next_state <= FETCH1;
      end
    end
    WB0: begin
      //do cache to cache transfer and writeback to memory
      if(!ccif.dwait[1]) begin  //TODO: fishy maybe // && !ccif.dWEN[1]
        next_state <= FETCH0;
      end else begin
        next_state <= WB0;
      end
    end
    WB1: begin
       //do cache to cache transfer and writeback to memory
      if(!ccif.dwait[0] ) begin    // && !ccif.dWEN[1]
        next_state <= FETCH1;
      end else begin
        next_state <= WB1;
      end
    end
  endcase
end

always_comb begin : OUTPUT
 ccif.ccsnoopaddr[0] = ccif.ccsnoopaddr[0];
 ccif.ccsnoopaddr[1] = ccif.ccsnoopaddr[1];
 ccif.ccwait = '0;
 ccif.ccinv = '0;
 ccif.ramstore = '0;
 ccif.ramaddr = ccif.iaddr[0]; //prioritize Core 0, icache
 ccif.iload[0] = ccif.iload[0]; 
 ccif.iload[1] = ccif.iload[1];
 ccif.dload = '0;
 ccif.ramWEN = '0;
 ccif.ramREN = '0; 
 ccif.iwait = 2'b11; //both wait
 ccif.dwait = 2'b11; //both wait

 casez(state) 
    IDLE: begin
      ccif.ccsnoopaddr[0] = '0;
      ccif.ccsnoopaddr[1] = '0;
		
      //%%%%%%%% non-coherence stuff, just choose normally %%%%%%%%%%%
      //Eric: "it could be either evicting or flushing"
      if(ccif.dWEN[0]) begin
      	 //write from core 1
         ccif.ramaddr = ccif.daddr[0];  
         ccif.ramstore = ccif.dstore[0]; 
         ccif.ramWEN = 1;
         ccif.ramREN = 0;
         ccif.dwait[0] = (ccif.ramstate == ACCESS)? 0:1;
         ccif.dwait[1] = 1;
      end else if(ccif.dWEN[1]) begin
      	 //write from core 2
         ccif.ramaddr = ccif.daddr[1];  
         ccif.ramstore = ccif.dstore[1]; 
         ccif.ramWEN = 1;
         ccif.ramREN = 0;
         ccif.dwait[1] = (ccif.ramstate == ACCESS)? 0:1;
         ccif.dwait[0] = 1;
      end else if(ccif.iREN[0]) begin  //prioritize core 0
         //serve instruction from CORE 0
         ccif.ramaddr = ccif.iaddr[0];  
         ccif.iload[0] = ccif.ramload; 
         ccif.ramWEN = 0;
         ccif.ramREN = 1;
         ccif.iwait[0] = (ccif.ramstate == ACCESS)? 0:1;
         ccif.iwait[1] = 1;
      end else if(ccif.iREN[1]) begin
         //serve instruction from CORE 1
         ccif.ramaddr = ccif.iaddr[1];
         ccif.iload[1] = ccif.ramload;
         ccif.ramWEN = 0;
         ccif.ramREN = 1;
         ccif.iwait[0] = 1;
         ccif.iwait[1] = (ccif.ramstate == ACCESS)? 0:1;
      end
      //%%%%%%%%%%% end of non-coherence %%%%%%%%%%%%%%%
      
      //TODO: add handle eviction (detect dWEN from either caches)      
            
    end
    ARBITRATE: begin
      ccif.ccwait[0] = 1;
      ccif.ccwait[1] = 1;
      //both cores wait
      ccif.iwait = 3;
      
      
    end
    SNOOP0: begin
      /*
       * snoop0 means we snoop cache 1
       */
      ccif.ccwait[1] = 1; //tell core 1 to wait (dont transition out of idle)
      ccif.ccwait[0] = 1; //Q: when we snoop should we tell both cores to wait???
      
      ccif.ccsnoopaddr[1] = ccif.daddr[0];  //give core 1 the address core 0 want to snoop
      
      //look for the response from the cache
      if(busRdX[0]) begin
        //invalidate everyone else on BusRdX
        ccif.ccinv[1] = 1;
      end else begin
      	//dont invalidate 
        ccif.ccinv[1] = 0; 
      end
    end
    SNOOP1: begin
      /* tell the core being snooped on, to wait
      *   send snoop tag
      *   do invalidation
      */
       
      ccif.ccwait[0] = 1; //tell core 0 to wait
      ccif.ccwait[1] = 1;
      ccif.ccsnoopaddr[0] = ccif.daddr[1]; 
      
      if(busRdX[1]) begin
        //invalidate everyone else on busrdx
        ccif.ccinv[0] = 1;
      end else begin
        ccif.ccinv[0] = 0; 
      end
    end
    PRE_WB0: begin
    	ccif.ccwait[1] = 1;    
         //don't do anything, just wait (this came after snooping core 1)
    	 //writeback 0 means we snooped cache 1 already
    	
    	 //---------------------------------------------------------------//
    	
	      //do C2C -- if cache one has it 
	      ccif.dload[0] = ccif.dstore[1]; //transfer to requester cache
	      //write back
	      ccif.ramstore = ccif.dstore[1]; //store the content of the SNOOPED cache
	      ccif.ramaddr = ccif.daddr[1]; //store the address of the SNOOPED cache
	      ccif.ramWEN = 1;
	      //tell the requester cache to stop waiting
	      ccif.dwait[0] = (ccif.ramstate == ACCESS)? 0:1;
	      ccif.dwait[1] = (ccif.ramstate == ACCESS)? 0:1;    
    end
    PRE_WB1: begin
    	  ccif.ccwait[0] = 1;    
       	  //don't do anything, just wait (this came from snooping core 0)
    	  //ccif.dwait[1] = (ccif.ramstate == ACCESS)? 0:1;
    	  
    	  //---------------------------------------------------------------//
    	  
    	  ccif.dload[1] = ccif.dstore[0]; //transfer to requester cache
	      //write back
	      ccif.ramstore = ccif.dstore[0]; //store the content of the SNOOPED cache
	      ccif.ramaddr = ccif.daddr[0]; //store the address of the SNOOPED cache
	      ccif.ramWEN = 1;
	      ccif.dwait[1] = (ccif.ramstate == ACCESS)? 0:1;
	      ccif.dwait[0] = (ccif.ramstate == ACCESS)? 0:1; //follow
    end
    WB0: begin
      ccif.ccwait[1] = 1;    
      //writeback 0 means we snooped cache 1 already
      //do C2C -- if cache one has it 
      ccif.dload[0] = ccif.dstore[1]; //transfer to requester cache
      //write back
      ccif.ramstore = ccif.dstore[1]; //store the content of the SNOOPED cache
      ccif.ramaddr = ccif.daddr[1]; //store the address of the SNOOPED cache
      ccif.ramWEN = 1;
      //tell the requester cache to stop waiting
      ccif.dwait[1] = (ccif.ramstate == ACCESS)? 0:1;    
      ccif.dwait[0] = (ccif.ramstate == ACCESS)? 0:1;
    end
    WB1: begin
      ccif.ccwait[0] = 1;    
      //do C2C
      ccif.dload[1] = ccif.dstore[0]; //transfer to requester cache
      //write back
      ccif.ramstore = ccif.dstore[0]; //store the content of the SNOOPED cache
      ccif.ramaddr = ccif.daddr[0]; //store the address of the SNOOPED cache
      ccif.ramWEN = 1;
      ccif.dwait[0] = (ccif.ramstate == ACCESS)? 0:1;
      ccif.dwait[1] = (ccif.ramstate == ACCESS)? 0:1;
    end
    FETCH1: begin
      ccif.ccsnoopaddr[0] = '0;
      ccif.ccsnoopaddr[1] = '0;
      
      ccif.ccwait[0] = 1;  
      //do stuff -- fetch from mem and give it to the goddamn requester
      ccif.ramaddr = ccif.daddr[1];
      ccif.ramREN = 1;
      ccif.ramstore = ccif.dstore[1];
      ccif.dwait[1] = (ccif.ramstate == ACCESS)? 0:1;
      ccif.dload[1] = ccif.ramload;
    end
    FETCH0: begin
      ccif.ccsnoopaddr[0] = '0;
      ccif.ccsnoopaddr[1] = '0;
      
      ccif.ccwait[1] = 1;  
      //do stuff -- fetch from mem and give it to the goddamn requester
      ccif.ramaddr = ccif.daddr[0];
      ccif.ramREN = 1;
      ccif.ramstore = ccif.dstore[0];
      ccif.dwait[0] = (ccif.ramstate == ACCESS)? 0:1;
      
      ccif.dload[0] = ccif.ramload;
    end
    SNOOP_WT1_B: begin
    	ccif.ccwait[0] = 1;
    end
    SNOOP_WT1_A: begin
    	ccif.ccwait[0] = 1;
    end
    SNOOP_WT0_A: begin 
    	ccif.ccwait[1] = 1;
    end
    SNOOP_WT0_B: begin
    	ccif.ccwait[1] = 1;
    end
 endcase
end

always_ff @ (posedge CLK, negedge nRST)begin
  if(!nRST) begin
    state <= IDLE;
  end else begin
    state <= next_state;
  end
end

endmodule

//Load cache into ram
/*assign ccif.iload = ccif.ramload;
assign ccif.dload = ccif.ramload;
assign ccif.ramstore = ccif.dstore;

always_comb begin : control_operations
    ccif.iwait = 2'b0;
    ccif.dwait = 2'b0;
    casez (ccif.ramstate)
      FREE: begin
        //the memory is free for both I and D
        ccif.iwait = 2'b0;
        ccif.dwait = 2'b0;
      end
      ACCESS: begin
        // memory is begin accessed
        // data is prioritized
        // if data is begin read or written
        // Instruction Fetch will wait

        ccif.iwait = ccif.dREN[CPUID] | ccif.dWEN[CPUID];
      end
      BUSY: begin
        //memory is being read
        ccif.iwait = 1'b1;
        ccif.dwait = 1'b1;
      end
      ERROR: begin
        //block all operations
        ccif.iwait = 1'b1;
        ccif.dwait = 1'b1;
      end
      default: begin
        ccif.iwait = 1'b0;
        ccif.dwait = 1'b0;
      end
   endcase
end

//note in the future other muxes will control other
//related signals

always_comb begin : priority_control_mux
    ccif.ramWEN = 1'b0;
    ccif.ramREN = 1'b0;
    ccif.ramaddr = 32'b0;

    //Prioritizes the data
    if(ccif.dREN[CPUID] == 1'b1) begin
      //if cache wants to read from RAM (data)
      ccif.ramREN = 1'b1;
      ccif.ramaddr = ccif.daddr;
    end else if (ccif.dWEN[CPUID] == 1'b1) begin
     //if cache wants to write to RAM (data)
      ccif.ramWEN = 1'b1;
      ccif.ramaddr = ccif.daddr;
    end else if (ccif.iREN[CPUID] == 1'b1) begin
     //if cache wants to read Instruction from RAM
      ccif.ramREN = 1'b1;
      ccif.ramaddr = ccif.iaddr;
    end
end
endmodule*/
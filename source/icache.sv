`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

import cpu_types_pkg::*;

module icache (
  input logic CLK, nRST,
  datapath_cache_if.icache dpif,
  cache_control_if.icache ccif
);

  parameter total_set = 16;
  parameter CPUID = 0;


  logic CACHE_WEN;
  typedef struct packed{
    logic [25:0] tag;
    word_t data;
    logic valid ;   
  } CacheTable;


  CacheTable [total_set - 1:0] dtable;
  
  typedef enum logic [1:0] {idle, fetch} StateType;

  StateType state, next_state;

  logic [25:0] rq_tag;
  logic [3:0] rq_index;

  word_t x_data;
  logic x_valid;
  logic [25:0] x_tag;
  logic [5:2] x_index;

  //requested index and tag
  assign rq_index = dpif.imemaddr[5:2];
  assign rq_tag = dpif.imemaddr[31:6];

  assign dpif.ihit = (rq_tag == dtable[rq_index].tag) && dtable[rq_index].valid ? 1 : 0;
  assign dpif.imemload = dtable[rq_index].data;
  assign ccif.iREN[CPUID] = !dpif.ihit && dpif.imemREN;
  assign ccif.iaddr[CPUID] = dpif.imemaddr;

  // always_ff @ (posedge CLK, negedge nRST) begin : cache_fsm
  //     if(!nRST) begin
  //         dtable <= '0;
  //     end else if(CACHE_WEN) begin
  //           dtable[rq_index].tag <= x_tag;
  //           dtable[rq_index].valid <= x_valid;
  //           dtable[rq_index].data <= x_data;
  //     end 
  // end
/*  
  always_comb begin: output_logic
    x_tag = '0;
    x_valid = 0;
    x_data = '0;
    CACHE_WEN = 0;
    casez(state)
      fetch: begin
              CACHE_WEN = 1;
              x_tag = rq_tag;
              x_valid = 1;
              x_data = ccif.iload[CPUID];
      end
     endcase
  end*/

  always_comb  begin : avinash
    if(!nRST) begin 
            dtable <= '0;
    end else if(CACHE_WEN) begin
            dtable[x_index].tag = x_tag;
            dtable[x_index].valid = x_valid;
            dtable[x_index].data = x_data;
    end
  end


  // always_comb begin : next_state_logic
  //    //start from idle
  //    next_state = state;
  //    if(state == fetch) begin
  //       next_state = fetch;
  //       if(!ccif.iwait[CPUID]) begin
  //         next_state = idle;
  //       end
  //    end else if(state == idle) begin
  //       if((!dcif.ihit) && (!ccif.iwait[CPUID])) begin
  //         next_state = fetch;
  //       end
  //    end
  //    // next_state = state;

  //    // if(state == fetch && ccif.iwait) begin
  //    //    //if in fetch, go to itself if waiting (otherwise go to idle)
  //    //    next_state = fetch;
  //    // end else if(state == idle && !dpif.ihit && dpif.imemREN)  begin
  //    //    //if in idle, go to fetch if data request is up and has not arrived yet
  //    //    next_state = fetch;
  //    // end else begin
  //    //    next_state = idle;
  //    // end
  // end

  always_ff @ (posedge CLK, negedge nRST) begin : kulkarni
    CACHE_WEN <= 1;
    if(!nRST) begin
        //state <= idle;
        CACHE_WEN <= '0;
        x_index <= '0;
        x_valid <= '0;
        x_data <= '0;
        x_index <= '0;
    end else if (dpif.imemREN && (!dpif.ihit) && (!ccif.iwait[CPUID])) begin
        //state <= next_state;
        CACHE_WEN <= 1;
        x_tag <= rq_tag;
        x_valid <= 1;
        x_data <= ccif.iload[CPUID];
        x_index <= rq_index;
   end
  end

endmodule
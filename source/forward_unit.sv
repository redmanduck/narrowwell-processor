`include "forward_unit_if.vh"
`include "cpu_types_pkg.vh"

module forward_unit(forward_unit_if.fwu fw_if);

  always_comb begin
    fw_if.forwardA = 0;
    //mem stage, register write
    if (fw_if.memRegWr && (fw_if.mem_rd == fw_if.ex_rs) && (fw_if.ex_rs !=0)) begin
      fw_if.forwardA = 1; //forward ALU Output from stage MEM
    end else if (fw_if.wbRegWr && (fw_if.wb_rd == fw_if.ex_rs) && (fw_if.ex_rs !=0)) begin
      fw_if.forwardA = 2; //forward write back output to alu
    end else begin
      fw_if.forwardA = 0;
    end
  end // end of always_comb

    //  I type forwarding
  always_comb begin
    fw_if.forwardData = 0;
    // register value changed when written back to memory at mem stage
    if (fw_if.memWr && (fw_if.mem_rd == fw_if.wb_rd)) begin
      fw_if.forwardData = 1;
    // register value changed when written back to memory at wb stage
    end else if (fw_if.wbRegWr && (fw_if.wb_rd == fw_if.mem_rt) && (fw_if.mem_rt != 0)) begin
      fw_if.forwardData = 1;
    end else begin
      fw_if.forwardData = 0;
    end
  end // end of always_comb
  
  // forwardB
  always_comb begin
    fw_if.forwardB = 0;
    if (fw_if.memRegWr && (fw_if.mem_rd == fw_if.ex_rt) && (fw_if.ex_rt != 0)) begin
      fw_if.forwardB = 1; // forward mem output to alu
    end else if (fw_if.wbRegWr && (fw_if.wb_rd == fw_if.ex_rt) && (fw_if.ex_rt != 0)) begin
      fw_if.forwardB = 2;// forward wb output to alu
    end else begin
      fw_if.forwardB = 0;
    end
  end // end of always_comb



endmodule

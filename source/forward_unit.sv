`include "forward_unit_if.vh"
`include "cpu_types_pkg.vh"

module forward_unit(
  forward_unit_if.fwu fw_if
);

  always_comb begin
    fw_if.forwardA = 0;

    //mem stage, register write
    if (fw_if.memRegWr && (fw_if.mem_rd == fw_if.ex_rs)) begin
      fw_if.forwardA = 1; //forward ALU Output from stage MEM
    end else if (fw_if.wbRegWr && (fw_if.wb_rd == fw_if.ex_rs)) begin
      fw_if.forwardA = 2; //forward write back output to alu
    end
  end 

  logic MEM_PendingRegWrite, WBPendingRegWrite; 

  // register value changed when written back to memory at mem stage
  assign MEM_PendingRegWrite = fw_if.memWr && (fw_if.mem_rd == fw_if.wb_rd);
  // register value changed when written back to memory at wb stage
  assign WBPendingRegWrite = fw_if.wbRegWr && (fw_if.wb_rd == fw_if.mem_rt);

  assign fw_if.forwardData = (MEM_PendingRegWrite || WBPendingRegWrite);

  always_comb begin
    fw_if.forwardB = 0;

    if (fw_if.memRegWr && (fw_if.mem_rd == fw_if.ex_rt)) begin
      fw_if.forwardB = 1; // forward mem output to alu
    end else if (fw_if.wbRegWr && (fw_if.wb_rd == fw_if.ex_rt)) begin
      fw_if.forwardB = 2; // forward wb output to alu
    end
  end // end of always_comb


endmodule
`include "hazard_unit_if.vh"

module hazard_unit(
   hazard_unit_if.hzu hzif
);

   assign hzif.stall_ifid = !((!hzif.halt || hzif.branch_taken || hzif.jump) && !hzif.stall_idex);
   assign hzif.stall_idex = !(!hzif.stall_xmem && !hzif.load) ;
   assign hzif.stall_xmem = (!hzif.dhit && (hzif.dmemWEN || hzif.dmemREN));
   assign hzif.stall_wb = hzif.stall_xmem;

   always_comb begin
     hzif.flush_xmem = 0;
     hzif.flush_wb = 0;
     if(!hzif.halt && (hzif.branch_taken == 1)) begin
        hzif.flush_ifid = 1;
        hzif.flush_idex = 1;
     end else if(!hzif.halt && hzif.jump) begin
        hzif.flush_ifid = 1;
        hzif.flush_idex = 1;
     end else begin
        hzif.flush_ifid = 0;
        hzif.flush_idex = 0;
     end
  end

endmodule

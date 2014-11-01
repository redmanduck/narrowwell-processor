/*
   Hazard Unit
*/

`include "hazard_unit_if.vh"

module hazard_unit(
   hazard_unit_if.hzu hzif
);

  always_comb begin
     hzif.stall_ifid = hzif.halt;
     hzif.stall_idex = (hzif.dmemREN || hzif.dmemWEN ? !hzif.dhit : 0);
     hzif.stall_xmem = (hzif.dmemREN || hzif.dmemWEN ? !hzif.dhit : 0); //wait for memory operations
     hzif.stall_wb = 0; 

     hzif.flush_ifid = (hzif.dmemREN || hzif.dmemWEN ? hzif.dhit : 0); //flush on dhit when RW
     hzif.flush_idex = 0;
     hzif.flush_xmem = 0;
     hzif.flush_wb = 0;

     hzif.pc_en = (hzif.dmemREN || hzif.dmemWEN ? hzif.dhit : 1);

     if(hzif.branch_taken == 1) begin
        hzif.flush_ifid = 1;
        hzif.flush_idex = 1;
     end else if(hzif.jump) begin
        hzif.flush_ifid = 1;
        hzif.flush_idex = 1;
     end else if(hzif.idex_rs == hzif.mwb_rd && (hzif.idex_rs && hzif.mwb_rd)) begin
        //hzif.stall_ifid = 1;
     end
  end


//  assign hzif.flush_ifid = (hzif.jump || (hzif.branch && hzif.is_equal) || (hzif.branch_neq && !hzif.is_equal)) ? 1 : hzif.dhit;

  //TODO: handle case where SW occur
endmodule

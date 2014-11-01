/*
   Hazard Unit
*/


`include "hazard_unit_if.vh"

module hazard_unit(
   hazard_unit_if.hzu hzif
);

// stall
  // always_comb begin
    // hzif.stall_ifid = hzif.halt;
  assign hzif.stall_ifid = !((!hzif.halt || hzif.branch_taken || hzif.jump) && !hzif.stall_idex);
     //hzif.stall_idex= ~(hzif.EMen & ~hzif.loading); //if there is a reg value in MEM that you need in EX, stall F,D stages while it loads.
    assign hzif.stall_idex = !(!hzif.stall_xmem && !hzif.load);
    // hzif.stall_idex = (hzif.dmemREN || hzif.dmemWEN ? !hzif.dhit : 0);
     //hzif.stall_xmem = (hzif.dmemREN || hzif.dmemWEN ? !hzif.dhit : 0); //wait for memory operations
    assign hzif.stall_xmem = (!hzif.dhit && (hzif.dmemWEN || hzif.dmemREN)); // wait for cache miss
    assign hzif.stall_wb = '0;  // don't stall
  // end  // end of always


// flush
  always_comb begin
     hzif.flush_xmem = 0;
     hzif.flush_wb = 0;
//     hzif.pc_en = (hzif.dmemREN || hzif.dmemWEN ? hzif.dhit : 1);
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
     //end else if(hzif.idex_rs == hzif.mwb_rd && (hzif.idex_rs && hzif.mwb_rd)) begin
        //hzif.stall_ifid = 1;
  end  // end of always_comb


endmodule

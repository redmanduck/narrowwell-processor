`ifndef HZU_IF_VH
`define HZU_IF_VH
`include "cpu_types_pkg.vh"

interface hazard_unit_if;
   logic stall_ifid, stall_xmem, stall_idex, stall_wb;
   logic flush_ifid, flush_xmem, flush_idex, flush_wb;
   logic branch_taken;
   logic pc_en;
   logic jump;
   logic dhit;
   logic mwb_rd;
   logic idex_rs;
   logic halt;
   logic dmemWEN, dmemREN;
   logic load;
   modport hzu(
     output stall_ifid, stall_xmem, stall_idex, stall_wb, flush_ifid, flush_xmem,
flush_idex, flush_wb, pc_en,
     input halt,dhit,mwb_rd, idex_rs, jump, branch_taken, dmemREN, dmemWEN, load
   );
endinterface
`endif

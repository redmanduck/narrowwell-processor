`ifndef ALU_IF_VH
`define ALU_IF_VH

`include "cpu_types_pkg.vh"

interface alu_if;
   import cpu_types_pkg::*;

   aluop_t opcode;
   word_t  op1, op2, result;
   logic [SHAM_W-1:0] shamt;
   logic   nf, vf, zf;
   
   modport aluif  (input  op1, op2, opcode, shamt,
      output result, nf, vf, zf
   );
         
endinterface

`endif
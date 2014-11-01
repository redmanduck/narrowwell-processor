`ifndef ALU_IF_VH
 `define ALU_IF_VH

 `include "cpu_types_pkg.vh"

interface alu_if;
   import cpu_types_pkg::*;
   
   aluop_t opcode;
   word_t  op1, op2, res;
   logic   flag_n, flag_v, flag_z;
   logic [SHAM_W-1:0] shamt;
   
   // regular module ports
   modport alum
     (
      input  op1, op2, opcode, shamt,
      output res, flag_n, flag_v, flag_z
      );
   	          
endinterface

`endif //ALU_VH

/***
program counter
*/

/// pc_cnt -> PC;
/// pcEN  -> pc_en
/// pc_regval -> rdata1;
/// pcif.branchmux  -> branch_flag

`include "pc_if.vh"
`include "cpu_types_pkg.vh"

module program_counter (
   input CLK, nRST,
   pc_if.pc pcif
);

   import cpu_types_pkg::*;

   word_t PC_next;
   word_t PC;

   parameter PC_INIT = 0;

   assign pcif.imemaddr = PC;
  // assign pcif.branch_addr = PC + 4 + {14'b0, pcif.imm16,2'b0};


   //next state logic
   always_comb begin
      casez (pcif.PCSrc)
        0: PC_next = PC + 4;  // normal pc update
        1: PC_next = pcif.rdat1;                    //JR
        /// diff
        //2: PC = {pc_4[31:28] , pcif.immediate26, 2'b0};  //JUMP, jal
        2: PC_next = pcif.immediate26 << 2;  //JUMP, jal
        /// diff
        //{14'b0, pcif.immediate, 2'b0} + PC + 4; //BNE, BEQ
        3: PC_next = pcif.branch_flag ? pcif.branch_addr : (PC + 4); //branch
        default: PC_next = PC;                    //REGULAR
      endcase
   end // end of always

   always_ff @ (posedge CLK, negedge nRST) begin
      if (!nRST) begin
        PC <= PC_INIT;
      end else if(pcif.pc_en) begin
        PC <= PC_next;
      end
   end // end of always ff

endmodule

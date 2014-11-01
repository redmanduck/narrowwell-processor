`include "cpu_types_pkg.vh"
`include "pipereg_if.vh"

import cpu_types_pkg::*;

module pl_id_ex(
   input logic CLK, nRST,
   pipereg_id_ex.idex idex
);
   //WB control regs
   logic [1:0] WB_MemToReg;
   logic WB_RegWrite;

   
   logic M_Branch,M_Jump, M_MemRead, M_MemWrite, BranchNEQ;
   logic [1:0] beq;
   //EX control signals
   logic [1:0] EX_RegDst, EX_ALUSrc, EX_ALUSrc2;
   aluop_t EX_ALUOp;

   word_t next_address;
   word_t rdat1;
   word_t rdat2;
   word_t sign_ext32;
   logic [4:0] rt;
   logic [4:0] rd, rs;
   logic [4:0] shamt;
   logic [25:0] immediate26;
   logic [2:0] PCSrc;
   word_t immediate;
   logic halt;
   word_t pcn;
   logic bubble;
   logic dREN;

   assign idex.beq_out = beq;
   assign idex.M_Jump_out = M_Jump;
   assign idex.pcn_out = pcn;
   assign idex.WB_MemToReg_out = WB_MemToReg;
   assign idex.WB_RegWrite_out = WB_RegWrite;
   assign idex.M_Branch_out = M_Branch;
   assign idex.M_MemRead_out = M_MemRead;
   assign idex.M_MemWrite_out = M_MemWrite;
   assign idex.EX_RegDst_out = EX_RegDst;
   assign idex.EX_ALUOp_out = EX_ALUOp;
   assign idex.EX_ALUSrc_out = EX_ALUSrc;
   assign idex.next_address_out = next_address;
   assign idex.rdat1_out = rdat1;
   assign idex.rdat2_out = rdat2;
   assign idex.sign_ext32_out = sign_ext32;
   assign idex.rt_out = rt;
   assign idex.rd_out = rd;
   assign idex.rs_out = rs;
   assign idex.EX_ALUSrc2_out = EX_ALUSrc2;
   assign idex.shamt_out = shamt;
   assign idex.immediate26_out = immediate26;
   assign idex.immediate_out = immediate;
   assign idex.halt_out = halt;
   assign idex.bubble_out = bubble;
   assign idex.BranchNEQ_out = BranchNEQ;
   assign idex.PCSrc_out = PCSrc;
   assign idex.dREN_out = dREN;
   //nothing to flush
   always_ff @(posedge CLK, negedge nRST) begin
      if(!nRST) begin //or flush
         WB_MemToReg <= '0;
         WB_RegWrite <= '0;
         pcn <= '0;
         beq <= '0;
         dREN <= '0;
         M_Branch <= '0;
         M_MemRead <= '0;
         M_MemWrite <= '0;
         EX_RegDst <= '0;
         bubble <= '0;
         EX_ALUOp <= ALU_ADD;
         EX_ALUSrc <= '0;
         EX_ALUSrc2 <= '0;
         immediate <= '0;
         immediate26 <= '0;
         next_address <= '0;
         PCSrc <= '0;
         rdat1 <= '0;
         rdat2 <= '0;
         sign_ext32 <= '0;
         halt <= '0;
         rt <= '0;
         rd <= '0;
         rs <= '0;
         BranchNEQ <= '0;
         shamt <= '0;
      end else if(idex.flush) begin
        WB_MemToReg <= '0;
        bubble <= '0;
        WB_RegWrite <= '0;
        M_Branch <= '0;
        pcn <= '0;
        beq <= '0;
        PCSrc <= 0;
        dREN <= 0;
        M_MemRead <= '0;
        M_MemWrite <= '0;
        M_Jump <= '0;
        BranchNEQ <= '0;
      end else if(idex.WEN == 1 && !idex.flush) begin
         $display("IDEX.Branch = %d", M_Branch);
         dREN <= idex.dREN_in;
         WB_MemToReg <= idex.WB_MemToReg_in;
         WB_RegWrite <= idex.WB_RegWrite_in;
         halt <= idex.halt_in;
         pcn <= idex.pcn_in;
         shamt <= idex.shamt_in;
         bubble <= idex.bubble_in;
         beq <= idex.beq_in;
         M_Branch <= idex.M_Branch_in;
         M_MemRead <= idex.M_MemRead_in;
         M_MemWrite <= idex.M_MemWrite_in;
         M_Jump <= idex.M_Jump_in;
         EX_RegDst <= idex.EX_RegDst_in;
         EX_ALUOp <= idex.EX_ALUOp_in;
         EX_ALUSrc <= idex.EX_ALUSrc_in;
         EX_ALUSrc2 <= idex.EX_ALUSrc2_in;
         next_address <= idex.next_address_in;
         rdat1 <= idex.rdat1_in;
         rdat2 <= idex.rdat2_in;
         sign_ext32 <= idex.sign_ext32_in;
         rt <= idex.rt_in;
         rd <= idex.rd_in;
         BranchNEQ <= idex.BranchNEQ_in;
         rs <= idex.rs_in;
         immediate26 <= idex.immediate26_in;
         immediate <= idex.immediate_in;
         PCSrc <= idex.PCSrc_in;
      end
  end

endmodule

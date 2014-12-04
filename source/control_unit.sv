
/*
  Pat Sabpisal
  ssabpisa@purdue.edu
*/

`include "control_unit_if.vh"
`include "cpu_types_pkg.vh"

module control_unit (
   control_unit_if.control cuif
);

  import cpu_types_pkg::*;

  //technically imemload will connect to instr

  assign cuif.opcode = opcode_t'(cuif.instruction[31:26]);
  assign cuif.funct = funct_t'(cuif.instruction[5:0]);
  assign cuif.immediate26 = cuif.instruction[25:0];
  assign cuif.immediate = cuif.instruction[15:0];
  assign cuif.rs = cuif.instruction[25:21];
  assign cuif.rt = cuif.instruction[20:16];
  assign cuif.rd = cuif.instruction[15:11];
  assign cuif.shamt = cuif.instruction[10:6];

  assign cuif.MemWr = (cuif.opcode == SW || cuif.opcode == SC ? 1 : 0);
  assign cuif.MemRead = (cuif.opcode == LW || cuif.opcode == LL || cuif.opcode == LUI ? 1 : 0);  //cuif.opcode == LUI??

  assign cuif.iREN = (cuif.opcode != HALT);

  assign cuif.dREN = (cuif.MemToReg == 2'b1 || cuif.opcode == LL ? 1 : 0);
  assign cuif.dWEN = cuif.MemWr;

 always_comb begin : REG_DST
    casez(cuif.opcode)
      XORI, LW, ORI, ADDIU, ANDI, LUI, LL, SLTI, SLTIU: cuif.RegDst = 1;
      JAL: cuif.RegDst = 2;
      RTYPE: cuif.RegDst = 0;
      default: cuif.RegDst = 1;
    endcase
 end

  always_comb begin : ExtOp
    casez(cuif.opcode)
      ORI: cuif.ExtOp = 0;
      XORI: cuif.ExtOp = 0;
      ANDI: cuif.ExtOp = 0;
      default: cuif.ExtOp = 1; //cuif.immediate[15];
    endcase
  end

   always_comb begin : HALT_LOGIC
     if(cuif.opcode == HALT) begin
       $display("HALTING");
       cuif.halt = 1;
     end else begin
       cuif.halt = 0;
     end
  end


   always_comb begin : PC_CONTROLS
    if(cuif.opcode == RTYPE && cuif.funct == JR) begin
       cuif.PCSrc = 1; 
    end else if(cuif.opcode == J || cuif.opcode == JAL) begin
       cuif.PCSrc = 2; 
    end else if(cuif.opcode == BEQ) begin
       cuif.PCSrc = 3; 
    end else if(cuif.opcode == BNE) begin
       cuif.PCSrc = 3; 
    end else begin
       cuif.PCSrc = 0; 
    end
  end

  always_comb begin : REGISTER_FILE_CONTROLS
    if(cuif.opcode == LW || cuif.opcode == LL || cuif.opcode == SC) begin
      //always write to reg FROM Data Memory
      cuif.MemToReg = 1;
    end else if (cuif.opcode == JAL) begin
      //write to reg FROM INSTR MEMORY
      cuif.MemToReg = 2;
    end else begin
       //always write to reg FROM ALU
      cuif.MemToReg = 0;
    end
  end

  always_comb begin : REG_EN_CONTROL

    if((cuif.opcode == RTYPE && cuif.opcode != JR) || cuif.opcode == JAL || cuif.opcode == ADDIU || cuif.opcode == ANDI || cuif.opcode == LUI || cuif.opcode == LW  || cuif.opcode == LL || cuif.opcode == SC || cuif.opcode == ORI || cuif.opcode == SLTI || cuif.opcode == SLTIU ||  cuif.opcode == XORI) begin
       cuif.RegWr = 1 & !(cuif.instruction == '0);
    end else begin
       //default, no write
       cuif.RegWr = 0;
    end
  end

  assign cuif.datomic = (cuif.opcode == LL || cuif.opcode == SC);   

   always_comb begin : ALU_SRC
      casez (cuif.opcode)
          RTYPE: cuif.ALUSrc = 0;
          ORI, ANDI, XORI, ADDIU, SLTI, SLTIU, SW, LW, LL, SC: cuif.ALUSrc = 1; 
          LUI: cuif.ALUSrc = 2;
          default: cuif.ALUSrc = 0;
      endcase
   end

  always_comb begin : ALU_CONTROLS
    if (cuif.opcode == RTYPE) begin
      //do RTYPE operations
      // cuif.ALUSrc2 = 1'b0; //Doesnt matter if ALUSrc is 0
      // cuif.ALUSrc = 2'b0; //Register
      cuif.ALUctr = ALU_ADD; //some useless default
      casez (cuif.funct)
        ADDU: cuif.ALUctr = ALU_ADD;
        ADD:  cuif.ALUctr = ALU_ADD; 
        AND:  cuif.ALUctr = ALU_AND;
        JR:   cuif.ALUctr = ALU_ADD;
        NOR:  cuif.ALUctr = ALU_NOR;
        OR:   cuif.ALUctr = ALU_OR;
        SLT:  cuif.ALUctr = ALU_SLT;
        SLTU: cuif.ALUctr = ALU_SLTU;
        SLL:  begin
          cuif.ALUctr = ALU_SLL;
          // cuif.ALUSrc = 1;
          // cuif.ALUSrc2 = 1'b1;
        end
        SRL:  begin
          cuif.ALUctr = ALU_SRL;
          // cuif.ALUSrc = 1;
          // cuif.ALUSrc2 = 1'b1;
        end
        SUBU: cuif.ALUctr = ALU_SUB;
        SUB: cuif.ALUctr = ALU_SUB;
        XOR: cuif.ALUctr = ALU_XOR;
        default: cuif.ALUctr = ALU_ADD;
      endcase
    end else begin
      //I-TYPES
      cuif.ALUctr = ALU_ADD;
      // cuif.ALUSrc2 = 1'b0;
      // cuif.ALUSrc = 1; 
      casez (cuif.opcode) 
        ANDI: cuif.ALUctr = ALU_AND;
        ADDIU: cuif.ALUctr = ALU_ADD;
        BEQ: begin
           cuif.ALUctr = ALU_SUB;
           // cuif.ALUSrc = 0;
        end
        BNE: begin
          cuif.ALUctr = ALU_SUB;
          // cuif.ALUSrc = 0;
        end
        LUI: begin
          // cuif.ALUSrc = 2;
          cuif.ALUctr = ALU_ADD;
        end
        LW: cuif.ALUctr = ALU_ADD;
        ORI: cuif.ALUctr = ALU_OR;
        SLTI: cuif.ALUctr = ALU_SLT;
        SLTIU: cuif.ALUctr = ALU_SLTU;
        SW: cuif.ALUctr = ALU_ADD;
        SC: cuif.ALUctr = ALU_ADD;
        LL: cuif.ALUctr = ALU_ADD;
        XORI: cuif.ALUctr = ALU_XOR;
        default: cuif.ALUctr = ALU_ADD;
      endcase
    end
  end
  
endmodule

//source code for alu
//Hao ALU
`include "alu_if.vh"
`include "cpu_types_pkg.vh"

module alu(alu_if.aluif a_if);
  import cpu_types_pkg::*;

  always_comb
  begin
    //default case
    a_if.result = 32'b0;
    a_if.vf = 0;

    casez (a_if.opcode)
    ALU_SLL: begin // logical shift left
      a_if.result = a_if.op1 << a_if.shamt;
      a_if.vf = 0;
    end
    ALU_SRL: begin // logical shift right
      a_if.result = a_if.op1 >> a_if.shamt;
      a_if.vf = 0;
    end
    ALU_AND: begin // and
      a_if.result = a_if.op1 & a_if.op2;
      a_if.vf = 0;
    end
    ALU_OR: begin //or
      a_if.result = a_if.op1 | a_if.op2;
      a_if.vf = 0;
    end
    ALU_XOR: begin //xor
      a_if.result = a_if.op1 ^ a_if.op2;
      a_if.vf = 0;
    end
    ALU_NOR: begin //nor
      a_if.result = ~(a_if.op1 | a_if.op2);
      a_if.vf = 0;
    end
    ALU_ADD: begin // signed add
      a_if.result = $signed(a_if.op1) + $signed(a_if.op2);

      if ((a_if.op1[31] == 1) && (a_if.op2[31]==1)) begin
        if (a_if.result[31] == 1)
          a_if.vf = 0;
        else if (a_if.result[31] == 0)
          a_if.vf = 1;
      end

      else if ((a_if.op1[31] == 0) && (a_if.op2[31]==0)) begin
        if (a_if.result[31] == 0)
          a_if.vf = 0;
        else if (a_if.result[31] == 1)
          a_if.vf = 1;
      end

      else if (a_if.op1[31] & a_if.op2[31])
        a_if.vf = 0;
    end

    ALU_SUB: begin //signed subtract
      a_if.result = $signed(a_if.op1) - $signed(a_if.op2);
      a_if.vf = 0;
    end
    ALU_SLT: begin //set less than signed
      a_if.result = $signed(a_if.op1) < $signed(a_if.op2) ? 1:0;
      a_if.vf = 0;
    end
    ALU_SLTU: begin //set less than unsigned
      a_if.result = a_if.op1 < a_if.op2 ? 1:0;
      a_if.vf = 0;
    end
    endcase
  end //end always_comb

  assign a_if.nf = a_if.result[31];
  assign a_if.zf = a_if.result == 0 ? 1:0;

endmodule

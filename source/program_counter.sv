`include "pc_if.vh"
`include "cpu_types_pkg.vh"

module program_counter (
   input CLK, nRST,
   pc_if.pc pcif
);

   //TODO: make interface for pc
   import cpu_types_pkg::*;
   word_t PC_next, PC_next_filtered;
   word_t PC;
   word_t pc_4;

   assign pc_4 = PC + 4;

   parameter PC_INIT = 0;

   assign pcif.imemaddr = PC;
   assign pcif.pc_plus_4 = pc_4;

   always_ff @ (posedge CLK, negedge nRST) begin
      PC <= PC;
      $display("PCEN = %d", pcif.pc_en);
      if(!nRST) begin
         PC <= PC_INIT;
      end else if (pcif.pc_en) begin
        $display("PCSrc = %d", pcif.PCSrc);
        // $display("IMM26 = %d", pcif.immediate26);

        casez (pcif.PCSrc)
          0: PC <= pcif.rdat1;                    //JR
          1: PC <= {pc_4[31:28] , pcif.immediate26, 2'b0};  //JUMP
          2: PC <= pcif.branch_addr;              //{14'b0, pcif.immediate, 2'b0} + PC + 4; //BNE, BEQ
          default: PC <= pc_4;                    //REGULAR
        endcase
        $display("PC = %h", PC);
        $display("JADDR %h",  {pc_4[31:28] , pcif.immediate26, 2'b0});
      end
  end



endmodule

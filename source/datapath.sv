`include "datapath_cache_if.vh"
`include "control_unit_if.vh"
`include "register_file_if.vh"
`include "ru_cu_if.vh"
`include "pc_if.vh"
`include "pipereg_if.vh"
`include "hazard_unit_if.vh"
`include "forward_unit_if.vh"

`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;
  parameter PC_INIT = 0;

  control_unit_if cuif();
  register_file_if rfif();
  pc_if pcif();
  pipereg_if_id ifid();
  pipereg_id_ex idex();
  pipereg_ex_mem xmem();
  pipereg_mem_wb mweb();
  hazard_unit_if hzif();
  forward_unit_if fwif();

  aluop_t alu_op;
  word_t alu_a;
  word_t alu_b;
  word_t alu_a_fwd, alu_b_fwd;
  word_t writeback;
  logic alu_nf;
  logic alu_vf;
  word_t alu_output;
  logic alu_zf;
  word_t fwd_rdat1, fwd_rdat2;

  logic stall;

  hazard_unit HZU(hzif);
  pl_if_id IFID(CLK, nRST, ifid);
  pl_id_ex IDEX(CLK, nRST, idex);
  pl_ex_mem EXMEM(CLK, nRST, xmem);
  pl_mem_wb MEMWB(CLK, nRST, mweb);
  control_unit CU(cuif);
  register_file RF(CLK, nRST, rfif);
  program_counter PC(CLK, nRST, pcif);
  forward_unit FWU(fwif);

  alu ALU(.ALUOP(alu_op), .Port_A(alu_a_fwd), .Port_B(alu_b_fwd), .negative(alu_nf), .overflow(alu_vf), .output_port(alu_output), .zero(alu_zf));


  //X Stage branch resolution
  always_comb begin : BRANCH_RESOLUTION
    pcif.PCSrc = idex.PCSrc_out;
    hzif.branch_taken = 0;

    if(alu_zf && idex.M_Branch_out) begin
        //Take 
        $display("taking this branch to %h", pcif.branch_addr);
        pcif.PCSrc = 2;
        hzif.branch_taken = 1;
    end else if (!alu_zf && idex.BranchNEQ_out) begin
        //Take
        $display("taking this branch to %h", pcif.branch_addr);
        pcif.PCSrc = 2;
        hzif.branch_taken = 1;
    end
  end


  always_comb begin : OPERAND_FORWARD_A
     casez(fwif.forwardA)
        1: alu_a_fwd = xmem.alu_output_out;
        2: alu_a_fwd = writeback;
        3: alu_a_fwd = dpif.dmemload;
        default: alu_a_fwd = alu_a;
     endcase
  end
  always_comb begin : OPERAND_FORWARD_B
     casez(fwif.forwardB)
        1: alu_b_fwd = xmem.alu_output_out;
        2: alu_b_fwd = writeback;
        3: alu_b_fwd = dpif.dmemload;
        default: alu_b_fwd = alu_b;
     endcase
  end

  assign fwif.ex_rs = idex.rs_out;
  assign fwif.ex_rt = idex.rt_out;
  assign fwif.ex_rd = idex.rd_out;
  assign fwif.mem_rd  = xmem.reg_instr_out; 
  assign fwif.wb_rd = mweb.reg_instr_out;
  assign fwif.regWr = mweb.WB_RegWrite_out || xmem.WB_RegWrite_out;//cuif.RegWr;
  assign fwif.regRd = 1'b1;
  assign fwif.memWr = idex.M_MemWrite_out;
  assign fwif.memRegWr = xmem.WB_RegWrite_out;
  assign fwif.exRegWr = idex.WB_RegWrite_out; 
  assign fwif.exMemWr = idex.M_MemWrite_out;//cuif.MemWr;

  assign xmem.alu_output_in = alu_output;

  assign rfif.rsel1 = cuif.rs;
  assign rfif.rsel2 = cuif.rt;
  assign rfif.WEN = mweb.WB_RegWrite_out;

  assign idex.flush = hzif.flush_idex;
  assign xmem.flush = hzif.flush_xmem;
  assign mweb.flush = 0;

  always_comb begin : RFIF_WRITE
    casez (mweb.WB_MemToReg_out)
      1: writeback = mweb.dmemload_out;
      2: writeback = mweb.pcn_out;  //pcif.imemaddr + 4;
      default: writeback = mweb.alu_output_out;
    endcase
  end

  assign rfif.wdat = writeback;

  always_comb begin : MUX_RGDST
    casez (idex.EX_RegDst_out) 
      1: xmem.reg_instr_in = idex.rd_out;
      2: xmem.reg_instr_in = 31; //JAL
      default: xmem.reg_instr_in = idex.rt_out;
    endcase
  end
  assign fwif.ex_RegDst = idex.EX_RegDst_out;

  assign dpif.dmemREN = xmem.M_MemRead_out;
  assign dpif.dmemWEN = xmem.M_MemWrite_out;

  assign dpif.imemREN = 1'b1;
  assign dpif.dmemstore = xmem.regfile_rdat2_out; 
  assign dpif.dmemaddr = xmem.alu_output_out;

  assign pcif.immediate26 = idex.immediate26_out; //used for Jump resolution
  assign pcif.immediate = idex.immediate_out;
  assign pcif.rdat1 = rfif.rdat1;
  assign pcif.branch_addr = idex.pcn_out + {14'b0, idex.immediate_out, 2'b0}; 
  assign pcif.pc_en = hzif.pc_en & nRST & !cuif.halt & dpif.ihit; // and first latch EN
 
  assign idex.M_Jump_in = cuif.Jump;

  assign dpif.imemaddr = pcif.imemaddr;

  assign cuif.instruction = ifid.instruction_out;
  assign cuif.alu_zf = alu_zf; 

  assign alu_op = (idex.M_Branch_out ? ALU_SUB : idex.EX_ALUOp_out); //if there is a branch, always do subtract
  assign alu_a = idex.rdat1_out;

  word_t shamt_extended;

  always_comb begin : MUX_ALU_B2
      if(idex.EX_ALUSrc2_out == 0) begin
          shamt_extended = idex.immediate_out;
      end else begin
          shamt_extended = {27'b0, idex.shamt_out};
      end
  end

  always_comb begin : MUX_ALU_B
       if(idex.EX_ALUSrc_out == 0) begin
          alu_b = idex.rdat2_out;
       end else if (idex.EX_ALUSrc_out == 2) begin
          alu_b = {idex.immediate_out, 16'b0}; //ok
       end else begin
          alu_b = shamt_extended;
       end
  end


 always_comb begin : Sign_Extender
       if(cuif.ExtOp) begin 
          idex.immediate_in = {16'hFFFF, cuif.immediate}; 
       end else begin 
          idex.immediate_in = {16'h0000, cuif.immediate};
       end
 end

  assign idex.immediate26_in = cuif.immediate26;
  assign idex.rt_in = cuif.rt;
  assign idex.rd_in = cuif.rd;
  assign idex.rs_in = cuif.rs;
  
  always_ff @ (posedge CLK, negedge nRST) begin
    if(!nRST) begin
        dpif.halt <= 0;
    end else begin
        dpif.halt <= mweb.halt_out;
    end
  end

  assign idex.halt_in = cuif.halt;
  assign xmem.halt_in = idex.halt_out;
  assign mweb.halt_in = xmem.halt_out;

  assign ifid.flush = hzif.flush_ifid;

  assign idex.bubble_in = ifid.flushed_out;


  assign idex.WEN = !hzif.stall_idex;
  assign ifid.WEN = !hzif.stall_ifid;
  assign xmem.WEN = !hzif.stall_xmem;
  assign mweb.WEN = !hzif.stall_wb;

  assign fwif.id_rt = cuif.rt;
  assign fwif.id_rs = cuif.rs;
  assign hzif.halt = cuif.halt; 
   

   assign idex.PCSrc_in = cuif.PCSrc;

   assign hzif.jump = idex.M_Jump_out;
   assign hzif.dhit = dpif.dhit;
   assign hzif.dmemREN = dpif.dmemREN;
   assign hzif.dmemWEN = dpif.dmemWEN;
   assign hzif.idex_rs = idex.rs_out;
   assign hzif.mwb_rd = mweb.reg_instr_out;

  assign ifid.instruction_in = dpif.imemload;
  assign ifid.next_address_in = pcif.pc_plus_4;

  assign idex.shamt_in = cuif.shamt;
  assign idex.next_address_in = pcif.pc_plus_4;
  assign idex.WB_MemToReg_in = cuif.MemToReg;
  assign idex.WB_RegWrite_in = cuif.RegWr;
  assign idex.M_Branch_in = cuif.Branch;
  assign idex.M_MemRead_in = cuif.dREN;
  assign idex.M_MemWrite_in = cuif.dWEN;
  assign idex.EX_RegDst_in = cuif.RegDst;
  assign idex.EX_ALUSrc_in = cuif.ALUSrc;
  assign idex.EX_ALUOp_in = cuif.ALUctr;
  assign idex.EX_ALUSrc2_in = cuif.ALUSrc2;
  assign idex.rdat1_in = rfif.rdat1;
  assign idex.rdat2_in = rfif.rdat2;
  assign ifid.pcn_in = pcif.pc_plus_4;
  assign idex.pcn_in = ifid.pcn_out;
  assign xmem.pcn_in = idex.pcn_out;
  assign mweb.pcn_in = xmem.pcn_out;
  assign xmem.M_Branch_in = idex.M_Branch_out;
  assign xmem.WB_MemToReg_in = idex.WB_MemToReg_out;
  assign xmem.WB_RegWrite_in = idex.WB_RegWrite_out;
  assign xmem.M_MemRead_in = idex.M_MemRead_out;
  assign xmem.M_MemWrite_in = idex.M_MemWrite_out;
  assign xmem.regfile_rdat2_in = (fwif.forwardData ? xmem.alu_output_out : idex.rdat2_out);
  assign xmem.alu_zero_in = alu_zf;
  assign mweb.WB_RegWrite_in = xmem.WB_RegWrite_out;
  assign mweb.WB_MemToReg_in = xmem.WB_MemToReg_out;
  assign mweb.dmemload_in = dpif.dmemload;
  assign mweb.alu_output_in = xmem.alu_output_out;
  assign fwif.wbRegWr = mweb.WB_RegWrite_out;
  assign fwif.exMemRead = xmem.M_MemRead_out;
  assign fwif.wbMemRead = mweb.M_MemRead_out;

  assign mweb.M_MemRead_in = xmem.M_MemRead_in;
  assign mweb.reg_instr_in = xmem.reg_instr_out;

  assign rfif.wsel = mweb.reg_instr_out;

endmodule

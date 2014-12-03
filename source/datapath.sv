`include "datapath_cache_if.vh"
`include "control_unit_if.vh"
`include "register_file_if.vh"
`include "ru_cu_if.vh"
`include "pc_if.vh"
`include "pipereg_if.vh"
`include "hazard_unit_if.vh"
`include "forward_unit_if.vh"
`include "alu_if.vh"

`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);

  import cpu_types_pkg::*;
  parameter PC_INIT = 0;

  //interfaces
  control_unit_if cuif();
  register_file_if rfif();
  pc_if pcif();
  alu_if alif();

  pipereg_if_id ifid();
  pipereg_id_ex idex();
  pipereg_ex_mem xmem();
  pipereg_mem_wb mwb();
  hazard_unit_if hzif();
  forward_unit_if fwif();

  word_t op2_tmp;
  regbits_t reg_instr_tmp;
  logic load_sync;   
  word_t op1_sync, op2_sync;
  word_t op1_forwarded;
  word_t op2_forwarded;   


  //Pipeline latches
  pl_if_id LATCH_IF_ID(CLK, nRST, ifid);
  pl_id_ex LATCH_ID_EX(CLK, nRST, idex);
  pl_ex_mem LATCH_EX_MEM(CLK, nRST, xmem);
  pl_mem_wb LATCH_MEM_WB(CLK, nRST, mwb);

  //////////////////////////////// SHARED LEVEL /////////////////////////////
  
  register_file REGFILE_UNIT(CLK, nRST, rfif);

  forward_unit FWD_UNIT(fwif);
  hazard_unit HAZ_UNIT(hzif);


  assign rfif.rsel1 = cuif.rs;
  assign rfif.rsel2 = cuif.rt;
  assign rfif.wsel  = mwb.reg_instr_out;
  assign rfif.WEN   = mwb.WB_RegWrite_out;  //mwb.dREN_out; 


   always_ff @ (posedge CLK, negedge nRST) begin
      if (!nRST) begin
          dpif.halt = 0;
      end else if (mwb.halt_out) begin
          dpif.halt = 1;  
      end
   end

  //////////////////////////////// HZ + FW /////////////////////////

   
   assign hzif.halt = idex.halt_out;

   assign hzif.ihit = dpif.ihit;
   assign hzif.dhit = dpif.dhit;
   
   assign hzif.branch_taken = pcif.branch_flag;
   assign hzif.jump = (idex.PCSrc_out == 2 || idex.PCSrc_out == 1) ? 1 : 0; ///**

   //LOAD USE
   always_comb begin
      if(hzif.dmemREN) begin
        if(fwif.ex_rt == fwif.mem_rt) begin
          hzif.load = 1;
        end else if (fwif.ex_rs == fwif.mem_rt) begin
          hzif.load = 1;
        end else begin
          hzif.load = 0;
        end
      end else begin
        hzif.load = 0;
      end
   end
   
   assign hzif.dmemREN = xmem.dREN_out;
   assign hzif.dmemWEN = xmem.M_MemWrite_out;

   assign fwif.ex_rs = idex.rs_out;
   assign fwif.ex_rt = idex.rt_out;
   
   assign fwif.mem_rt = xmem.rt_out;
   assign fwif.mem_rd = reg_instr_tmp; //*(*)
   assign fwif.memRegWr = xmem.WB_RegWrite_out;
   assign fwif.memWr = xmem.M_MemWrite_out;

   assign fwif.wb_rd  = mwb.reg_instr_out; 
   assign fwif.wbRegWr  = mwb.WB_RegWrite_out; 

  //////////////////////////////// PIPELINE LATCHES CONTROLS /////////////////////////

  assign ifid.flush = hzif.flush_ifid;
  assign idex.flush = hzif.flush_idex;
  assign xmem.flush = hzif.flush_xmem;
  assign mwb.flush = hzif.flush_wb;

  assign ifid.WEN = !hzif.stall_ifid;
  assign idex.WEN = !hzif.stall_idex;
  assign xmem.WEN = !hzif.stall_xmem;
  assign mwb.WEN = !hzif.stall_wb;

  ///////////////////////////////  FETCH STAGE //////////////////////////////
  program_counter #(PC_INIT) PC_UNIT(CLK, nRST, pcif);

  always_comb begin : IFID_INSTR
      if (pcif.pc_en) begin
        ifid.instruction_in = dpif.imemload;
      end else begin  
        ifid.instruction_in = '0; 
      end
  end

   assign ifid.pcn_in = pcif.imemaddr + 4; //pc+4

   assign dpif.imemaddr = pcif.imemaddr;

   assign pcif.PCSrc = idex.PCSrc_out;
   assign pcif.rdat1 = idex.rdat1_out;
   assign pcif.imm16 = idex.immediate_out;
   assign pcif.immediate26 = idex.immediate26_out;

   assign pcif.pc_en = !hzif.stall_ifid ? ((!cuif.halt && !dpif.halt && dpif.ihit) || hzif.jump || hzif.branch_taken) : 0;

   always_comb begin : branchmode
      casez(idex.beq_out)
        1: pcif.branch_flag = !alif.zf ? 1 : 0; 
        2: pcif.branch_flag = alif.zf ? 1 : 0;
        default: pcif.branch_flag = 0;
      endcase
   end

   assign pcif.branch_addr = idex.pcn_out + {14'b0, idex.immediate_out, 2'b0};

  /////////////////////////////// DECODE STAGE /////////////////////////////


   control_unit CONTROL_UNIT(cuif);

   assign cuif.instruction = ifid.instruction_out;


  //////////////////////////////// EXECUTE STAGE ///////////////////////////

   alu ALU(alif);

   assign alif.opcode = idex.EX_ALUOp_out;
   assign alif.shamt = idex.shamt_out; 

   assign dpif.dmemaddr = xmem.alu_output_out;
   assign dpif.imemREN = !dpif.halt ;
   assign dpif.dmemREN = xmem.dREN_out;
   assign dpif.dmemWEN = xmem.M_MemWrite_out;

  //////////////////////////////// MEM ACCESS STAGE /////////////////////////


   always_comb begin : Forwarding_M
      casez (fwif.forwardData)
        0: dpif.dmemstore = xmem.dmemstore_out; //TODO: add this 
        1: dpif.dmemstore = rfif.wdat;
        default: dpif.dmemstore = xmem.dmemstore_out;
      endcase
   end

  /////////////////////////////// WRITE BACK STAGE //////////////////////////

   always_comb begin : MemToReg
      casez (mwb.WB_MemToReg_out)
        1: rfif.wdat = mwb.dmemload_out; //LW
        2: rfif.wdat = mwb.pcn_out; //JAL
        default: rfif.wdat = mwb.alu_output_out;
      endcase
   end

   //To memory address select port
   always_comb begin : reg_instr_out
      casez (xmem.EX_RegDst_out)
        0: reg_instr_tmp = xmem.rd_out; 
        1: reg_instr_tmp = xmem.rt_out;
        2: reg_instr_tmp = 31; 
        default: reg_instr_tmp = xmem.rd_out;
      endcase
   end
   

  ////////////////////////////// ALU ////////////////////////////////////////

  //SYNCHRONIZER 
   always_ff @ (posedge CLK, negedge nRST) begin
      if (!nRST) begin
         op1_sync <= '0;
         op2_sync <= '0;
         load_sync <= '0;  
      end else begin
         op1_sync <= alif.op1;
         op2_sync <= alif.op2;
         load_sync <= hzif.load;  
      end
   end

   assign alif.op1 = (load_sync && (fwif.forwardB == 2)) ? op1_sync : op1_forwarded;
   assign alif.op2 = (load_sync && (fwif.forwardA == 2)) ? op2_sync : op2_forwarded;
      
   always_comb begin : Forward_ALU_A
      casez (fwif.forwardA)
        1: op1_forwarded = xmem.alu_output_out;
        2: op1_forwarded = rfif.wdat;
        default: op1_forwarded = idex.rdat1_out;
      endcase
   end
   
   always_comb begin : Forward_ALU_B1
      casez (fwif.forwardB)
          1: op2_tmp = xmem.alu_output_out;
          2: op2_tmp = rfif.wdat;
          default: op2_tmp = idex.rdat2_out;
      endcase
   end

   always_comb begin : Forward_ALU_B2
      casez (idex.EX_ALUSrc_out)
          0: op2_forwarded = op2_tmp;
          1: op2_forwarded = idex.immediate_out;
          2: op2_forwarded = {idex.immediate_out, 16'b0}; //LUI
          default: op2_forwarded = idex.rdat2_out; 
      endcase
   end


  //////////////////////////////// LATCHING STUFF OVER /////////////////////////

   assign idex.pcn_in = ifid.pcn_out;
   assign idex.rdat1_in = rfif.rdat1;
   assign idex.rdat2_in = rfif.rdat2;
   assign idex.rd_in = cuif.rd;
   assign idex.rs_in = cuif.rs;
   assign idex.rt_in = cuif.rt;
   assign idex.immediate_in =  (cuif.ExtOp ? (cuif.immediate[15] ? {16'hFFFF, cuif.immediate} : {16'h0, cuif.immediate}) : {16'b0, cuif.immediate}); 
   assign idex.immediate26_in = $signed(cuif.immediate26);
   assign idex.EX_ALUOp_in = cuif.ALUctr;
   assign idex.EX_ALUSrc_in = cuif.ALUSrc;
   assign idex.shamt_in = cuif.shamt;
   assign idex.EX_RegDst_in = cuif.RegDst;
   assign idex.M_MemWrite_in = cuif.MemWr;
   assign idex.WB_MemToReg_in = cuif.MemToReg;
   assign idex.PCSrc_in = cuif.PCSrc;
   assign idex.WB_RegWrite_in = cuif.RegWr;

   assign idex.dREN_in = cuif.dREN;
   assign idex.halt_in  = cuif.halt;
   assign idex.beq_in = (cuif.opcode == BEQ) ? 2 : ((cuif.opcode == BNE) ? 1 : 0);

   assign xmem.pcn_in = idex.pcn_out;
   assign xmem.dmemstore_in = op2_tmp;
   assign xmem.alu_output_in = alif.result;
   assign xmem.rd_in = idex.rd_out;
   assign xmem.rt_in = idex.rt_out;
   assign xmem.EX_RegDst_in = idex.EX_RegDst_out; 
   assign xmem.WB_MemToReg_in = idex.WB_MemToReg_out;
   assign xmem.PCSrc_in = idex.PCSrc_out;
   assign xmem.WB_RegWrite_in = idex.WB_RegWrite_out;
   assign xmem.M_MemWrite_in = idex.M_MemWrite_out;
   assign xmem.dREN_in = idex.dREN_out;
   assign xmem.halt_in = idex.halt_out;

   assign mwb.pcn_in = xmem.pcn_out;
   assign mwb.alu_output_in = xmem.alu_output_out;
   assign mwb.dmemload_in = dpif.dmemload;
   assign mwb.WB_RegWrite_in = xmem.WB_RegWrite_out;
   assign mwb.reg_instr_in = reg_instr_tmp;
   assign mwb.WB_MemToReg_in = xmem.WB_MemToReg_out;
   assign mwb.dREN_in = xmem.dREN_out;
   assign mwb.halt_in = xmem.halt_out;

   //TODO: pass datomic over to the MEMACCESS stage, and pass that to dpif
   assign idex.datomic_in = cuif.datomic;
   assign xmem.datomic_in = idex.datomic_out;
   assign dpif.datomic = xmem.datomic_out;
endmodule

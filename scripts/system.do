onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/PC
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/PC_INIT
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/PC_next
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/nRST
add wave -noupdate -expand -group PCIF /system_tb/CLK
add wave -noupdate -expand -group PCIF /system_tb/nRST
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/pc_en
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/PCSrc
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/rdat1
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/immediate26
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/imm16
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/branch_flag
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/imemaddr
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/pc_plus_4
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/branch_addr
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/CLK
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/nRST
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/CACHE_WEN
add wave -noupdate -expand -group ICACHE -expand /system_tb/DUT/CPU/CM/ICACHE/dtable
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/state
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/next_state
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/iload_hold
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/rq_tag
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/rq_index
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/x_data
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/x_valid
add wave -noupdate -expand -group ICACHE /system_tb/DUT/CPU/CM/ICACHE/x_tag
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/stall_ifid
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/stall_xmem
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/stall_idex
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/stall_wb
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/flush_ifid
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/flush_xmem
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/flush_idex
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/flush_wb
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/branch_taken
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/pc_en
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/jump
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/dhit
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/mwb_rd
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/idex_rs
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/halt
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/dmemWEN
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/dmemREN
add wave -noupdate -group HZF /system_tb/DUT/CPU/DP/hzif/load
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/CLK
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/nRST
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/next_address
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/instruction
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/pcn
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/idex/WEN
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/CLK
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/nRST
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/WB_MemToReg
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/WB_RegWrite
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_Branch
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_Jump
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_MemRead
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_MemWrite
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/BranchNEQ
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/beq
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/EX_RegDst
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/EX_ALUSrc
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/EX_ALUOp
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/next_address
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rdat1
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rdat2
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/sign_ext32
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rt
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rd
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rs
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/shamt
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/immediate26
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/PCSrc
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/immediate
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/halt
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/pcn
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/bubble
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/dREN
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/opcode
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/op1
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/op2
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/res
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/flag_n
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/flag_v
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/flag_z
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/shamt
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/iREN
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/instruction
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/funct
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/opcode
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/rs
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/rt
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/rd
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/shamt
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/immediate
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/immediate26
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/alu_zf
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/MemToReg
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/RegWr
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/MemWr
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/ExtOp
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/ALUctr
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/RegDst
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/PCSrc
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/ALUSrc
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/MemRead
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/ALUSrc2
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/Jump
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/BranchNEQ
add wave -noupdate -group CONTROL /system_tb/DUT/CPU/DP/cuif/Branch
add wave -noupdate /system_tb/DUT/CPU/DP/REGFILE_UNIT/regs
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/CLK
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/nRST
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/WB_MemToReg
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/WB_RegWrite
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/M_Branch
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/M_MemRead
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/M_MemWrite
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/alu_zero
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/pcn
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/alu_output
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/adder_result
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/regfile_rdat2
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/reg_instr
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/halt
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/dREN
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/dmemstore
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/rt
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/rd
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/EX_RegDst
add wave -noupdate -group XMEM /system_tb/DUT/CPU/DP/LATCH_EX_MEM/PCSrc
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/CLK
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/nRST
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/dmemload
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/alu_output
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/dmemaddr
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/WB_RegWrite
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/M_MemRead
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/WB_MemToReg
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/reg_instr
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/halt
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/pcn
add wave -noupdate -group MWB /system_tb/DUT/CPU/DP/LATCH_MEM_WB/dREN
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group {DATAPATH IF} /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/CLK
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/nRST
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/LRU
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/cway
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/state
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/next_state
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/rq_tag
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/rq_index
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/hit_out
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/hit0
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/hit1
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/tag_match0
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/tag_match1
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/cur_lru
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/rq_blockoffset
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/hitcount
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/hitcount_next
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/hit_wait_count
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/hit_wait_count_next
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/FLUSH_INDEX_INCREM_EN
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/which_word
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/write_dirty
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/write_valid
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/CACHE_WEN
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/write_data
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/write_tag
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/flushset
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/flush_index
add wave -noupdate -group DCCAHE /system_tb/DUT/CPU/CM/DCACHE/next_lru
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/ex_rs
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/ex_rt
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/mem_rd
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/wb_rd
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/memRegWr
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/wbRegWr
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/forwardData
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/memWr
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/mem_rt
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/forwardA
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/forwardB
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/regWr
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/id_rs
add wave -noupdate -group FWIF /system_tb/DUT/CPU/DP/fwif/id_rt
add wave -noupdate -expand -group prif /system_tb/DUT/prif/ramREN
add wave -noupdate -expand -group prif /system_tb/DUT/prif/ramWEN
add wave -noupdate -expand -group prif /system_tb/DUT/prif/ramaddr
add wave -noupdate -expand -group prif /system_tb/DUT/prif/ramstore
add wave -noupdate -expand -group prif /system_tb/DUT/prif/ramload
add wave -noupdate -expand -group prif /system_tb/DUT/prif/ramstate
add wave -noupdate -expand -group prif /system_tb/DUT/prif/memREN
add wave -noupdate -expand -group prif /system_tb/DUT/prif/memWEN
add wave -noupdate -expand -group prif /system_tb/DUT/prif/memaddr
add wave -noupdate -expand -group prif /system_tb/DUT/prif/memstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/iwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/iREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate -expand -group ccif -expand /system_tb/DUT/CPU/CC/ccif/iload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/iaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/daddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccinv
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccwrite
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/cctrans
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccsnoopaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramstate
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {838311 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2 us}

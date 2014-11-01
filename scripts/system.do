onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/PC
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/PC_INIT
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/PC_next
add wave -noupdate -expand -group PCIF -expand -group PCUNIT /system_tb/DUT/CPU/DP/PC_UNIT/nRST
add wave -noupdate -expand -group PCIF /system_tb/CLK
add wave -noupdate -expand -group PCIF /system_tb/nRST
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/ihit
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/dhit
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/pc_en
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/PCSrc
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/rdat1
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/immediate26
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/imm16
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/branch_flag
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/imemaddr
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/pc_plus_4
add wave -noupdate -expand -group PCIF /system_tb/DUT/CPU/DP/pcif/branch_addr
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/stall_ifid
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/stall_xmem
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/stall_idex
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/stall_wb
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/flush_ifid
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/flush_xmem
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/flush_idex
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/flush_wb
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/branch_taken
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/pc_en
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/jump
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/dhit
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/mwb_rd
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/idex_rs
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/halt
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/dmemWEN
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/dmemREN
add wave -noupdate -expand -group HZF /system_tb/DUT/CPU/DP/hzif/load
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/CLK
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/nRST
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/next_address
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/instruction
add wave -noupdate -expand -group IFID /system_tb/DUT/CPU/DP/LATCH_IF_ID/pcn
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/idex/WEN
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/CLK
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/nRST
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/WB_MemToReg
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/WB_RegWrite
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_Branch
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_Jump
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_MemRead
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/M_MemWrite
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/BranchNEQ
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/beq
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/EX_RegDst
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/EX_ALUSrc
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/EX_ALUSrc2
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/EX_ALUOp
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/next_address
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rdat1
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rdat2
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/sign_ext32
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rt
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rd
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/rs
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/shamt
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/immediate26
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/PCSrc
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/immediate
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/halt
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/pcn
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/bubble
add wave -noupdate -expand -group IDEX /system_tb/DUT/CPU/DP/LATCH_ID_EX/dREN
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/opcode
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/op1
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/op2
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/res
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/flag_n
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/flag_v
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/flag_z
add wave -noupdate -expand -group ALU /system_tb/DUT/CPU/DP/ALU/aluif/shamt
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {109227 ps} 0}
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
WaveRestoreZoom {0 ps} {250 ns}

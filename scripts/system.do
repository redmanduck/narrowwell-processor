onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group memcontroller /system_tb/DUT/CPU/CC/CLK
add wave -noupdate -group memcontroller /system_tb/DUT/CPU/CC/nRST
add wave -noupdate -group memcontroller /system_tb/DUT/CPU/CC/next_state
add wave -noupdate -group memcontroller /system_tb/DUT/CPU/CC/state
add wave -noupdate -group memcontroller /system_tb/DUT/CPU/CC/busRdX
add wave -noupdate -group memcontroller /system_tb/DUT/CPU/CC/busRd
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/CLK
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/CACHE_WEN
add wave -noupdate -group ICACHE1 -color Yellow -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/ICACHE/dtable[15]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[14]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[13]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[12]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[11]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[10]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[9]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[8]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[7]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[6]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[5]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[4]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[3]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[2]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[1]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[0]} {-color Yellow -height 17}} /system_tb/DUT/CPU/CM1/ICACHE/dtable
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/rq_tag
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/rq_index
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_data
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_valid
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_tag
add wave -noupdate -group ICACHE1 -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_index
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/CACHE_WEN
add wave -noupdate -group ICACHE0 -color {Spring Green} -expand -subitemconfig {{/system_tb/DUT/CPU/CM0/ICACHE/dtable[15]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[14]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[13]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[12]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[11]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[10]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[9]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[8]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[7]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[6]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[5]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[4]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[3]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[2]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[1]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[0]} {-color {Spring Green} -height 17}} /system_tb/DUT/CPU/CM0/ICACHE/dtable
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/rq_tag
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/rq_index
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_data
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_valid
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_tag
add wave -noupdate -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_index
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/stall_ifid
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/stall_xmem
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/stall_idex
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/stall_wb
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/flush_ifid
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/flush_xmem
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/flush_idex
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/flush_wb
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/branch_taken
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/pc_en
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/jump
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/dhit
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/ihit
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/mwb_rd
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/idex_rs
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/halt
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/dmemWEN
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/dmemREN
add wave -noupdate -group {hazard unit (Core 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/hzif/load
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/branch_taken
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/dhit
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/dmemREN
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/dmemWEN
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/flush_idex
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/flush_ifid
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/flush_wb
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/flush_xmem
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/halt
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/idex_rs
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/ihit
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/jump
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/load
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/mwb_rd
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/pc_en
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/stall_idex
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/stall_ifid
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/stall_wb
add wave -noupdate -group {hazard unit (Core 2)} -color Yellow /system_tb/DUT/CPU/DP1/hzif/stall_xmem
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/halt
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/ihit
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/imemREN
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/imemload
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/imemaddr
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/dhit
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/datomic
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/dmemREN
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/dmemWEN
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/flushed
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/dmemload
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/dmemstore
add wave -noupdate -group {dpif1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/DP1/dpif/dmemaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -expand -group ccif -expand /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -expand -group ccif -expand /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/WEN
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/flush
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/flushed_out
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/flushed_in
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/next_address_out
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/instruction_out
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/next_address_in
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color Green /system_tb/DUT/CPU/DP0/ifid/instruction_in
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/pcn_out
add wave -noupdate -expand -group {IFID0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/ifid/pcn_in
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/CLK
add wave -noupdate -expand -group {PC0 (CORE1)} /system_tb/DUT/CPU/DP0/pcif/pc_en
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/nRST
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/PC_next
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/PC
add wave -noupdate -expand -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/CLK
add wave -noupdate -expand -group {PC1 (CORE2)} -color Yellow /system_tb/DUT/CPU/DP1/pcif/pc_en
add wave -noupdate -expand -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/PC
add wave -noupdate -expand -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/PC_INIT
add wave -noupdate -expand -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/PC_next
add wave -noupdate -expand -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/nRST
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/CACHE_WEN
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/CPUID
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/FLUSH_INDEX_INCREM_EN
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/LRU
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/cur_lru
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/cway
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/flush_index
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/flushset
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit0
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit1
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit_out
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit_wait_count
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit_wait_count_next
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hitcount
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hitcount_next
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/next_lru
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/next_state
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/rq_blockoffset
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/rq_index
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/rq_tag
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit0
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit1
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_index
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_offset
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_tag
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_way
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/tag_match0
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/tag_match1
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/total_set
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/way_count
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/which_word
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_data
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_dirty
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_tag
add wave -noupdate -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_valid
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/LRU
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/cway
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/next_state
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/rq_tag
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_tag
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/rq_index
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_index
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/hit_out
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/hit0
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/hit1
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_hit
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_hit0
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_hit1
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_way
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/tag_match0
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/tag_match1
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/cur_lru
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/rq_blockoffset
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_offset
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/hitcount
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/hitcount_next
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/hit_wait_count
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/hit_wait_count_next
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/FLUSH_INDEX_INCREM_EN
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/which_word
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_dirty
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_valid
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/CACHE_WEN
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_data
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_tag
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_addr
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/flushset
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/flush_index
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/next_lru
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {307660 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
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
WaveRestoreZoom {0 ps} {1004884 ps}

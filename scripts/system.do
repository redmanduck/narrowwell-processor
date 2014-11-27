onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {CORE 2}
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
add wave -noupdate -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/CLK
add wave -noupdate -group {PC1 (CORE2)} -color Yellow /system_tb/DUT/CPU/DP1/pcif/pc_en
add wave -noupdate -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/PC
add wave -noupdate -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/PC_INIT
add wave -noupdate -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/PC_next
add wave -noupdate -group {PC1 (CORE2)} -color Gold /system_tb/DUT/CPU/DP1/PC_UNIT/nRST
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/CLK
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/CACHE_WEN
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/ICACHE/dtable[15]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[14]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[13]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[12]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[11]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[10]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[9]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[8]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[7]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[6]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[5]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[4]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[3]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[2]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[1]} {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/ICACHE/dtable[0]} {-color Yellow -height 17}} /system_tb/DUT/CPU/CM1/ICACHE/dtable
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/rq_tag
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/rq_index
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_data
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_valid
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_tag
add wave -noupdate -group {ICACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/ICACHE/x_index
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/CACHE_WEN
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/CPUID
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/FLUSH_INDEX_INCREM_EN
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/LRU
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/cur_lru
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/DCACHE/cway[1]} {-color Yellow -height 17 -expand} {/system_tb/DUT/CPU/CM1/DCACHE/cway[1].dtable} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0]} {-color Yellow -height 17 -expand} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable} {-color Yellow -expand} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[7]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[6]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[5]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[4]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[3]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[2]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[1]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[0]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[0].tag} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[0].block} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[0].valid} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/cway[0].dtable[0].dirty} {-color Yellow}} /system_tb/DUT/CPU/CM1/DCACHE/cway
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/flush_index
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/flushset
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit0
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit1
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/hit_out
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/next_lru
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/rq_blockoffset
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/rq_index
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/rq_tag
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow -subitemconfig {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[25]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[24]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[23]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[22]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[21]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[20]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[19]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[18]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[17]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[16]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[15]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[14]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[13]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[12]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[11]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[10]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[9]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[8]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[7]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[6]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[5]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[4]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[3]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[2]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[1]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.tag[0]} {-color Yellow} /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.idx {-color Yellow -height 17} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.idx[2]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.idx[1]} {-color Yellow} {/system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.idx[0]} {-color Yellow} /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.blkoff {-color Yellow -height 17} /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr.bytoff {-color Yellow -height 17}} /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit0
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit1
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_index
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_offset
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_tag
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/snoop_way
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/tag_match0
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/tag_match1
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/total_set
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/way_count
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/which_word
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_data
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_dirty
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_tag
add wave -noupdate -expand -group {DCACHE1 (CORE 2)} -color Yellow /system_tb/DUT/CPU/CM1/DCACHE/write_valid
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/WEN
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/flush
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/flushed_out
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/flushed_in
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/next_address_out
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/instruction_out
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/instruction_in
add wave -noupdate -group {IFID1(CORE 2)} -color Gold /system_tb/DUT/CPU/DP1/ifid/pcn_out
add wave -noupdate -group {IFID1(CORE 2)} /system_tb/DUT/CPU/DP1/ifid/pcn_in
add wave -noupdate -divider {CORE 1}
add wave -noupdate -expand -group {REG (Core 1)} -subitemconfig {{/system_tb/DUT/CPU/DP0/REGFILE_UNIT/regs[11]} {-color Yellow -height 17}} /system_tb/DUT/CPU/DP0/REGFILE_UNIT/regs
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/CACHE_WEN
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} -expand -subitemconfig {{/system_tb/DUT/CPU/CM0/ICACHE/dtable[15]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[14]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[13]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[12]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[11]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[10]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[9]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[8]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[7]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[6]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[5]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[4]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[3]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[2]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[1]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/ICACHE/dtable[0]} {-color {Spring Green} -height 17}} /system_tb/DUT/CPU/CM0/ICACHE/dtable
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/rq_tag
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/rq_index
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_data
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_valid
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_tag
add wave -noupdate -group {ICACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_index
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/LRU
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} -expand -subitemconfig {{/system_tb/DUT/CPU/CM0/DCACHE/cway[1]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0]} {-color {Spring Green} -height 17 -expand} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable} {-color {Spring Green} -expand} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[7]} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[6]} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[5]} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[4]} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[3]} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[2]} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[1]} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/cway[0].dtable[0]} {-color {Spring Green}}} /system_tb/DUT/CPU/CM0/DCACHE/cway
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
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/FLUSH_INDEX_INCREM_EN
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/which_word
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_dirty
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_valid
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/CACHE_WEN
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_data
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/write_tag
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/snoop_addr
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} -expand -subitemconfig {{/system_tb/DUT/CPU/CM0/DCACHE/flushset[1]} {-color {Spring Green} -height 17} {/system_tb/DUT/CPU/CM0/DCACHE/flushset[0]} {-color {Spring Green} -height 17 -expand} {/system_tb/DUT/CPU/CM0/DCACHE/flushset[0].tag} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/flushset[0].block} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/flushset[0].valid} {-color {Spring Green}} {/system_tb/DUT/CPU/CM0/DCACHE/flushset[0].dirty} {-color {Spring Green}}} /system_tb/DUT/CPU/CM0/DCACHE/flushset
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/flush_index
add wave -noupdate -expand -group {DCACHE0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/CM0/DCACHE/next_lru
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
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/ihit
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/dhit
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/pc_en
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/PCSrc
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/rdat1
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/immediate26
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/imm16
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/branch_flag
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/imemaddr
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/pc_plus_4
add wave -noupdate -expand -group {pcif (CORE 1)} /system_tb/DUT/CPU/DP0/pcif/branch_addr
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -expand -group {dpif0 (CORE 1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/CLK
add wave -noupdate -expand -group {PC0 (CORE1)} /system_tb/DUT/CPU/DP0/pcif/pc_en
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/nRST
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/PC
add wave -noupdate -expand -group {PC0 (CORE1)} -color {Spring Green} /system_tb/DUT/CPU/DP0/PC_UNIT/PC_next
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
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/halt_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/halt_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/WEN
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_Jump_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_Jump_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/flush
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/WB_RegWrite_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_Branch_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_MemRead_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_MemWrite_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_RegDst_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_ALUSrc_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_ALUSrc_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/WB_RegWrite_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_Branch_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_MemRead_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/M_MemWrite_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_RegDst_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/WB_MemToReg_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/WB_MemToReg_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_ALUOp_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_ALUOp_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/next_address_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/next_address_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rdat1_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rdat1_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rdat2_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rdat2_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/sign_ext32_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/sign_ext32_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rs_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rs_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rt_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rt_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rd_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/rd_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/shamt_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/shamt_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_ALUSrc2_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/EX_ALUSrc2_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/immediate26_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/immediate26_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/immediate_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/immediate_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/pcn_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/pcn_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/bubble_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/bubble_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/BranchNEQ_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/BranchNEQ_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/PCSrc_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/PCSrc_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/beq_in
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/beq_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/dREN_out
add wave -noupdate -group {IDEX0 (CORE 1)} /system_tb/DUT/CPU/DP0/idex/dREN_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/WEN
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/flush
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/WB_RegWrite_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/M_Branch_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/M_MemRead_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/M_MemWrite_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/WB_RegWrite_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/M_Branch_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/M_MemRead_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/M_MemWrite_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/alu_zero_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/alu_zero_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/halt_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/halt_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/WB_MemToReg_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/WB_MemToReg_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/EX_RegDst_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/EX_RegDst_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/pcn_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/pcn_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/alu_output_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/alu_output_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/adder_result_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/adder_result_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/PCSrc_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/PCSrc_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/regfile_rdat2_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/regfile_rdat2_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/reg_instr_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/reg_instr_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/dREN_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/dREN_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/rt_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/rt_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/rd_in
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/rd_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/dmemstore_out
add wave -noupdate -group {EXMEM0 (CORE 1)} /system_tb/DUT/CPU/DP0/xmem/dmemstore_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/halt_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/halt_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/WB_MemToReg_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/WB_MemToReg_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/WEN
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/flush
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/dmemload_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/dmemload_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/dmemaddr_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/dmemaddr_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/WB_RegWrite_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/WB_RegWrite_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/pcn_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/pcn_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/reg_instr_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/reg_instr_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/M_MemRead_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/M_MemRead_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/alu_output_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/alu_output_out
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/dREN_in
add wave -noupdate -group {MWB0 (CORE 1)} /system_tb/DUT/CPU/DP0/mwb/dREN_out
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/opcode
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/op1
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/op2
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/res
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/flag_n
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/flag_v
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/flag_z
add wave -noupdate -expand -group {ALU (Core 1)} /system_tb/DUT/CPU/DP0/aluif/shamt
add wave -noupdate -divider Shared
add wave -noupdate -expand -group memcontroller -color {Green Yellow} /system_tb/DUT/CPU/CC/CLK
add wave -noupdate -expand -group memcontroller -color {Green Yellow} /system_tb/DUT/CPU/CC/nRST
add wave -noupdate -expand -group memcontroller -color {Green Yellow} /system_tb/DUT/CPU/CC/state
add wave -noupdate -expand -group memcontroller -color {Green Yellow} /system_tb/DUT/CPU/CC/busRdX
add wave -noupdate -expand -group memcontroller -color {Green Yellow} /system_tb/DUT/CPU/CC/busRd
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/dwait[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/dwait[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/dREN[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/dREN[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/dWEN[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/dWEN[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/iload[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/iload[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/dload[1]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dload[0]} {-color {Green Yellow}}} /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/dstore[1]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][31]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][30]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][29]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][28]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][27]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][26]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][25]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][24]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][23]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][22]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][21]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][20]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][19]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][18]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][17]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][16]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][15]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][14]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][13]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][12]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][11]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][10]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][9]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][8]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][7]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][6]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][5]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][4]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][3]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][2]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][1]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[1][0]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][31]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][30]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][29]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][28]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][27]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][26]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][25]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][24]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][23]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][22]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][21]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][20]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][19]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][18]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][17]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][16]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][15]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][14]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][13]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][12]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][11]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][10]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][9]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][8]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][7]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][6]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][5]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][4]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][3]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][2]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][1]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/dstore[0][0]} {-color {Green Yellow}}} /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/iaddr[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/iaddr[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/ccwait[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/ccwait[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/ccwrite[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/ccwrite[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/cctrans[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/cctrans[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -expand -group ccif -color {Green Yellow} -expand -subitemconfig {{/system_tb/DUT/CPU/ccif/ccsnoopaddr[1]} {-color {Green Yellow} -height 17} {/system_tb/DUT/CPU/ccif/ccsnoopaddr[0]} {-color {Green Yellow} -height 17}} /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -expand -group ccif -color {Green Yellow} /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -expand -group ccif -color {Green Yellow} -subitemconfig {{/system_tb/DUT/CPU/ccif/ramstore[31]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[30]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[29]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[28]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[27]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[26]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[25]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[24]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[23]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[22]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[21]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[20]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[19]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[18]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[17]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[16]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[15]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[14]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[13]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[12]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[11]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[10]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[9]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[8]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[7]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[6]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[5]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[4]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[3]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[2]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[1]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramstore[0]} {-color {Green Yellow}}} /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -expand -group ccif -color {Green Yellow} -subitemconfig {{/system_tb/DUT/CPU/ccif/ramload[31]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[30]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[29]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[28]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[27]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[26]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[25]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[24]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[23]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[22]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[21]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[20]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[19]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[18]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[17]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[16]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[15]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[14]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[13]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[12]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[11]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[10]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[9]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[8]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[7]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[6]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[5]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[4]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[3]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[2]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[1]} {-color {Green Yellow}} {/system_tb/DUT/CPU/ccif/ramload[0]} {-color {Green Yellow}}} /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/flushing
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5219518 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 224
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
WaveRestoreZoom {4078530 ps} {6117802 ps}

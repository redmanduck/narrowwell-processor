onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group PCIF /system_tb/CLK
add wave -noupdate -expand -group PCIF /system_tb/nRST
add wave -noupdate -expand -group memcontroller /system_tb/DUT/CPU/CC/CLK
add wave -noupdate -expand -group memcontroller /system_tb/DUT/CPU/CC/nRST
add wave -noupdate -expand -group memcontroller /system_tb/DUT/CPU/CC/next_state
add wave -noupdate -expand -group memcontroller /system_tb/DUT/CPU/CC/state
add wave -noupdate -expand -group memcontroller /system_tb/DUT/CPU/CC/busRdX
add wave -noupdate -expand -group memcontroller /system_tb/DUT/CPU/CC/busRd
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/CLK
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/CACHE_WEN
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/dtable
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/rq_tag
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/rq_index
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/x_data
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/x_valid
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/x_tag
add wave -noupdate -expand -group ICACHE1 -color Turquoise /system_tb/DUT/CPU/CM1/ICACHE/x_index
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/CACHE_WEN
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/dtable
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/rq_tag
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/rq_index
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_data
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_valid
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_tag
add wave -noupdate -expand -group ICACHE0 -color {Spring Green} /system_tb/DUT/CPU/CM0/ICACHE/x_index
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/ccif/iaddr
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {51493 ps} 0}
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
WaveRestoreZoom {0 ps} {1015448 ps}

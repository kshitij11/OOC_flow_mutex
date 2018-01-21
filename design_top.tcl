
set outputDir /home/wwjiang/Xilinx2/Vivado/2017.3/bin/async_elements_new/mutex2_test_batch_mode

read_verilog $outputDir/mutex2_dummy.v 
read_verilog $outputDir/test_gen_dummy.v 
read_verilog $outputDir/top.v 

synth_design -mode out_of_context -flatten_hierarchy rebuilt -top top -part xc7vx485tffg1761-1

write_edif $outputDir/top.edf -force

write_checkpoint $outputDir/top.dcp -force

read_xdc $outputDir/constraints_top.xdc

read_checkpoint -cell mutex $outputDir/mutex2_routed.dcp -strict 
reset_property HD.PARTPIN_LOCS [get_pins mutex/*]
route_design -unroute -nets [get_nets -of [get_pins mutex/*]]
lock_design -level routing mutex

read_checkpoint -cell t0 $outputDir/test_gen_routed.dcp -strict
reset_property HD.PARTPIN_LOCS [get_pins t0/*]
route_design -unroute -nets [get_nets -of [get_pins t0/*]]
lock_design -level routing t0

source $outputDir/new_batch_insert_ila.tcl

opt_design

place_design

route_design

report_timing_summary

write_edif $outputDir/top_routed.edf -force

write_checkpoint $outputDir/top_routed.dcp -force


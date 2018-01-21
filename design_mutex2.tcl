set outputDir /home/wwjiang/Xilinx2/Vivado/2017.3/bin/async_elements_new/mutex2_test_batch_mode

read_verilog $outputDir/mutex2.v 

synth_design -mode out_of_context -flatten_hierarchy rebuilt -top mutex2 -part xc7vx485tffg1761-1

write_edif $outputDir/mutex2_synth.edf -force

write_checkpoint $outputDir/mutex2_synth.dcp -force

read_xdc $outputDir/constraints_mutex2.xdc

opt_design

place_design

route_design

write_edif $outputDir/mutex2_routed.edf -force

write_checkpoint $outputDir/mutex2_routed.dcp -force


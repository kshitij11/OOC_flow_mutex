
set outputDir /home/wwjiang/Xilinx2/Vivado/2017.3/bin/async_elements_new/mutex2_test_batch_mode

read_verilog $outputDir/test_gen.v 

synth_design -mode out_of_context -flatten_hierarchy rebuilt -top test_gen -part xc7vx485tffg1761-1

write_edif $outputDir/test_gen_synth.edf -force

write_checkpoint $outputDir/test_gen_synth.dcp -force

read_xdc $outputDir/constraints_test_gen.xdc

opt_design

place_design

route_design

write_edif $outputDir/test_gen_routed.edf -force

write_checkpoint $outputDir/test_gen_routed.dcp -force


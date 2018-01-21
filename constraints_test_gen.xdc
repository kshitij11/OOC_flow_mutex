
create_clock -period 8.000 -name clk -waveform {0.000 4.000} [get_ports clk]

#set_input_delay -clock clk 3.0 [get_ports reset]
#set_input_delay -clock clk 3.0 [get_ports grant0]
#set_input_delay -clock clk 3.0 [get_ports grant1]

#set_output_delay -clock clk 5.0 [get_ports req0]
#set_output_delay -clock clk 5.0 [get_ports req1]

#set_system_jitter 0.0

#set_clock_latency -source -min 0.10

#set_clock_latency -source -max 0.20

create_pblock pblock_test_gen
add_cells_to_pblock [get_pblocks pblock_test_gen] -top
resize_pblock [get_pblocks pblock_test_gen] -add {SLICE_X176Y277:SLICE_X177Y277}
set_property CONTAIN_ROUTING true [get_pblocks pblock_test_gen]

set_property HD.CLK_SRC BUFGCTRL_X0Y18 [get_ports clk]
#set_property IO_BUFFER_TYPE IBUF [get_ports reset]

set_property HD.PARTPIN_LOCS INT_R_X123Y277 [get_ports req0]
set_property HD.PARTPIN_LOCS INT_R_X123Y277 [get_ports req1]
set_property HD.PARTPIN_LOCS INT_R_X123Y277 [get_ports reset]
set_property HD.PARTPIN_LOCS INT_R_X123Y277 [get_ports grant0]
set_property HD.PARTPIN_LOCS INT_R_X123Y277 [get_ports grant1]

set_property BEL AFF [get_cells req0_temp_reg]
set_property LOC SLICE_X177Y277 [get_cells req0_temp_reg]
set_property BEL AFF [get_cells req1_temp_reg]
set_property LOC SLICE_X176Y277 [get_cells req1_temp_reg]


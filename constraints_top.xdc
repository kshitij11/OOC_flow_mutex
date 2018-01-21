
set_property PACKAGE_PIN AV40 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]

set_property PACKAGE_PIN E19 [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_p]

create_clock -period 8.000 -name clk_p [get_ports clk_p]

#set_input_delay -clock clk_p 1.0 [get_ports reset]

set_system_jitter 0.0

set_property IO_BUFFER_TYPE none [get_ports reset]
set_property IO_BUFFER_TYPE none [get_ports clk_p]

#set_property HD.CLK_SRC BUFGCTRL_X0Y18 [get_ports clk_p]

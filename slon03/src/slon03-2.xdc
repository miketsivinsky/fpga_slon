#---
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#---
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk100]
create_clock -period 10.000 -name clk100 -waveform {0.000 5.000} [get_ports clk100]
set_switching_activity -deassert_resets

#---
set_property PACKAGE_PIN T10 [get_ports {ledGreen[3]}]
set_property PACKAGE_PIN T9 [get_ports {ledGreen[2]}]
set_property PACKAGE_PIN J5 [get_ports {ledGreen[1]}]
set_property PACKAGE_PIN H5 [get_ports {ledGreen[0]}]

#---
set_property IOSTANDARD LVCMOS33 [get_ports {ledGreen}]
set_property IOB TRUE [get_ports {ledGreen}]

#---
create_pblock slon_pblock
add_cells_to_pblock [get_pblocks slon_pblock] [get_cells -quiet [list {ledCounter_reg[0]} {ledCounter_reg[10]} {ledCounter_reg[11]} {ledCounter_reg[12]} {ledCounter_reg[13]} {ledCounter_reg[14]} {ledCounter_reg[15]} {ledCounter_reg[16]} {ledCounter_reg[17]} {ledCounter_reg[18]} {ledCounter_reg[19]} {ledCounter_reg[1]} {ledCounter_reg[20]} {ledCounter_reg[21]} {ledCounter_reg[22]} {ledCounter_reg[23]} {ledCounter_reg[24]} {ledCounter_reg[25]} {ledCounter_reg[26]} {ledCounter_reg[27]} {ledCounter_reg[2]} {ledCounter_reg[3]} {ledCounter_reg[4]} {ledCounter_reg[5]} {ledCounter_reg[6]} {ledCounter_reg[7]} {ledCounter_reg[8]} {ledCounter_reg[9]}]]
resize_pblock [get_pblocks slon_pblock] -add {SLICE_X8Y103:SLICE_X31Y143}

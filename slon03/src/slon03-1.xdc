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


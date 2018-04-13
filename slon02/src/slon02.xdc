set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

set_property PACKAGE_PIN T10 [get_ports {ledGreen[7]}]
set_property PACKAGE_PIN T9 [get_ports {ledGreen[6]}]
set_property PACKAGE_PIN J5 [get_ports {ledGreen[5]}]
set_property PACKAGE_PIN H5 [get_ports {ledGreen[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {ledGreen}]
set_property direction OUT [get_ports {ledGreen}]
 

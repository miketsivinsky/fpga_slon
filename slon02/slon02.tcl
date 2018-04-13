#---
set prjName slon02
puts "******* $prjName project init file *******\n"

#---
create_project $prjName . -part xc7a35ticsg324-1L
set_property design_mode PinPlanning [current_fileset]
add_files -fileset constrs_1 -norecurse src/$prjName.xdc

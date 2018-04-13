#---
set prjName slon01
puts "******* $prjName project init file *******\n"

#---
create_project $prjName . -part xc7a35ticsg324-1L
add_files -scan_for_includes src
add_files -fileset constrs_1 -norecurse src/$prjName.xdc

#---
launch_runs synth_1 -jobs 6    
wait_on_run synth_1
launch_runs impl_1 -jobs 6 -to_step write_bitstream
wait_on_run impl_1


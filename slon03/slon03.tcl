#------------------------------------------------------------------------------
proc check_status { jobName } {
    if {[get_property PROGRESS [get_runs $jobName]] != "100%"} {
        error "ERROR: $jobName failed"
    } else {
        puts "INFO: $jobName completed. Ok."
    }	
}

#------------------------------------------------------------------------------
proc gen_prj_struct { prjName nRuns } {
    for {set i 1} { $i <= $nRuns} { incr i} {
       #---
       if {[lsearch [get_filesets ] constrs_${i}] == -1} {
           create_fileset -constrset constrs_${i}
       }
       add_files -fileset constrs_${i} -norecurse src/${prjName}-${i}.xdc

       #---
       if {[lsearch [get_runs ] synth_${i}] == -1} {
           create_run synth_${i} -constrset constrs_${i} -flow {Vivado Synthesis 2016}
       }

       #---
       if {[lsearch [get_runs ] impl_${i}] == -1} {
           create_run impl_${i} -parent_run synth_${i} -flow {Vivado Implementation 2016}
       }
    }
}

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

#---
set prjName slon03
set nRuns 2
puts "******* $prjName project init file *******\n"

#---
create_project $prjName . -part xc7a35ticsg324-1L
gen_prj_struct $prjName $nRuns
add_files -scan_for_includes src

#---
for {set i 1} { $i <= $nRuns} { incr i} {
    launch_runs synth_${i} -jobs 6    
}

#---
for {set i 1} { $i <= $nRuns} { incr i} {
    wait_on_run synth_${i}
    check_status synth_${i}
    launch_runs impl_${i} -jobs 6 -to_step write_bitstream
}

#---
for {set i 1} { $i <= $nRuns} { incr i} {
    wait_on_run impl_${i}
    check_status impl_${i}
}

#----------------------------------------------------------------
#set_property USED_IN {synthesis implementation} [get_files src/$prjName.xdc]
#set_property top ${prjName}_m [current_fileset]

#launch_runs synth_1 impl_1 synth_2 impl_2 -jobs 6

#foreach x [lsort -decreasing [get_filesets -filter {FILESET_TYPE == *Constr*}]] {puts "$x [get_property FILESET_TYPE $x]"}
#foreach x [get_filesets] {puts "$x"}
#puts [lsearch [get_filesets ] constrs_21]



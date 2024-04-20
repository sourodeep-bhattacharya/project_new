# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/sek49/Documents/project_new/processor.runs/synth_1/Wrapper.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/sek49/Documents/project_new/processor.cache/wt [current_project]
set_property parent.project_path C:/Users/sek49/Documents/project_new/processor.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/sek49/Documents/project_new/processor.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_mem C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/Downloads/addi_basic.mem
read_verilog -library xil_defaultlib {
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/ALU_adder.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/CLA.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/CLA_block.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/Decode.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/Execute.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/Fetch.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/Memory.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/new/PWMSerializers.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/RAM.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/ROM.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/alu.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/ander.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/barrel_shifter_left.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/barrel_shifter_right.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/bypassing.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/completeType.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/counter.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/dffe_ref.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/divider.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/exceptions.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/hazard.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/new/iclk_gen.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/multdiv.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/multiplier.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/mux_16.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/mux_2.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/mux_32.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/mux_4.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/mux_8.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/notter.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/orer.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/processor.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/new/pwn.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/regfile.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/registerEx.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/project_new/rxuartlite.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/new/seg7_control.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_left_1.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_left_16.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_left_2.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_left_4.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_left_8.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_right_1.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_right_16.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_right_2.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_right_4.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/shift_right_8.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/new/spi_master.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/tflipflop.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/new/top.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/project_new/txuartlite.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/type.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/new/uart_rx.v
  C:/Users/sek49/Documents/project_new/processor.srcs/sources_1/imports/240551425/Wrapper.v
}
OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/sek49/Documents/project_new/processor.srcs/constrs_1/imports/lab-3-master/master.xdc
set_property used_in_implementation false [get_files C:/Users/sek49/Documents/project_new/processor.srcs/constrs_1/imports/lab-3-master/master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top Wrapper -part xc7a100tcsg324-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Wrapper.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Wrapper_utilization_synth.rpt -pb Wrapper_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }

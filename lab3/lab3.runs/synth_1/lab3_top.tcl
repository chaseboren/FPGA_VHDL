# 
# Synthesis run script generated by Vivado
# 

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
set_param synth.incrementalSynthesisCache ./.Xil/Vivado-25517-Vivado-dev/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/chase/github/FPGA_VHDL/lab3/lab3.cache/wt [current_project]
set_property parent.project_path /home/chase/github/FPGA_VHDL/lab3/lab3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part_repo_paths /opt/Xilinx/Vivado/2018.1/data/boards/board_files [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo /home/chase/github/FPGA_VHDL/lab3/lab3.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/sources_1/new/dtype.vhd
  /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/sources_1/new/pulse_generator.vhd
  /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/sources_1/new/upcounter.vhd
  /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/sources_1/new/seg7_hex.vhd
  /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/sources_1/new/seg7_controller.vhd
  /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/sources_1/new/lab3_top.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/constrs_1/new/nexys4_constraint.xdc
set_property used_in_implementation false [get_files /home/chase/github/FPGA_VHDL/lab3/lab3.srcs/constrs_1/new/nexys4_constraint.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top lab3_top -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef lab3_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file lab3_top_utilization_synth.rpt -pb lab3_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

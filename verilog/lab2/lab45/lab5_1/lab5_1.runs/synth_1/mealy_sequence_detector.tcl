# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/pc/Desktop/lab45/lab5_1/lab5_1.cache/wt [current_project]
set_property parent.project_path C:/Users/pc/Desktop/lab45/lab5_1/lab5_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib C:/Users/pc/Desktop/lab45/lab5_1/lab5_1.srcs/sources_1/new/mealy_sequence_detector.v
synth_design -top mealy_sequence_detector -part xc7a100tcsg324-1
write_checkpoint -noxdef mealy_sequence_detector.dcp
catch { report_utilization -file mealy_sequence_detector_utilization_synth.rpt -pb mealy_sequence_detector_utilization_synth.pb }
# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7vx485tffg1157-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Administrator/Desktop/lab3/lab3_3_2/lab3_3_2.cache/wt [current_project]
set_property parent.project_path C:/Users/Administrator/Desktop/lab3/lab3_3_2/lab3_3_2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib C:/Users/Administrator/Desktop/lab3/lab3_3_2/lab3_3_2.srcs/sources_1/new/two_2_bit_multiplier.v
synth_design -top two_2_bit_multiplier -part xc7vx485tffg1157-1
write_checkpoint -noxdef two_2_bit_multiplier.dcp
catch { report_utilization -file two_2_bit_multiplier_utilization_synth.rpt -pb two_2_bit_multiplier_utilization_synth.pb }

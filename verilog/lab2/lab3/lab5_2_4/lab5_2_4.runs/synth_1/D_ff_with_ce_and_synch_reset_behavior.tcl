# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7vx485tffg1157-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/pc/Desktop/lab3/lab5_2_4/lab5_2_4.cache/wt [current_project]
set_property parent.project_path C:/Users/pc/Desktop/lab3/lab5_2_4/lab5_2_4.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib C:/Users/pc/Desktop/lab3/lab5_2_4/lab5_2_4.srcs/sources_1/new/D_ff_with_ce_and_synch_reset_behavior.v
synth_design -top D_ff_with_ce_and_synch_reset_behavior -part xc7vx485tffg1157-1
write_checkpoint -noxdef D_ff_with_ce_and_synch_reset_behavior.dcp
catch { report_utilization -file D_ff_with_ce_and_synch_reset_behavior_utilization_synth.rpt -pb D_ff_with_ce_and_synch_reset_behavior_utilization_synth.pb }

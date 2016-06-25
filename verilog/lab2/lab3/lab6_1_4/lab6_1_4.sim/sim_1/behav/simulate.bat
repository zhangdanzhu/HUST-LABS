@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim Parallel_in_serial_out_load_enable_behavior_tb_behav -key {Behavioral:sim_1:Functional:Parallel_in_serial_out_load_enable_behavior_tb} -tclbatch Parallel_in_serial_out_load_enable_behavior_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

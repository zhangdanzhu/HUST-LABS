@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim Register_with_synch_reset_set_load_tb_behav -key {Behavioral:sim_1:Functional:Register_with_synch_reset_set_load_tb} -tclbatch Register_with_synch_reset_set_load_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
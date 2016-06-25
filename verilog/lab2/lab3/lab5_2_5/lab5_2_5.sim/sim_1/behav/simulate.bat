@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim T_ff_enable_behavior_tb_behav -key {Behavioral:sim_1:Functional:T_ff_enable_behavior_tb} -tclbatch T_ff_enable_behavior_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

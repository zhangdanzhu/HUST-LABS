@echo off
set xv_path=D:\\xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim moore_sequence_detecor_tb_behav -key {Behavioral:sim_1:Functional:moore_sequence_detecor_tb} -tclbatch moore_sequence_detecor_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

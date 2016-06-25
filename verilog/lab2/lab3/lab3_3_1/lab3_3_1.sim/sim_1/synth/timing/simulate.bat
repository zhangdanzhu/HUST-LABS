@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim two_2_bit_comparator_tb_time_synth -key {Post-Synthesis:sim_1:Timing:two_2_bit_comparator_tb} -tclbatch two_2_bit_comparator_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

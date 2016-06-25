@echo off
set xv_path=D:\\xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim counter_rom_tb_time_synth -key {Post-Synthesis:sim_1:Timing:counter_rom_tb} -tclbatch counter_rom_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

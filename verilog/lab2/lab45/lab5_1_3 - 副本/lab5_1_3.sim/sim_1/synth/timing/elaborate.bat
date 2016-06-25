@echo off
set xv_path=D:\\xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 8ff7907d1fef4b3b8ec099e5caef3ec3 -m64 --debug typical --relax --mt 2 --maxdelay -L xil_defaultlib -L simprims_ver -L secureip --snapshot counter_rom_tb_time_synth -transport_int_delays -pulse_r 0 -pulse_int_r 0 xil_defaultlib.counter_rom_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

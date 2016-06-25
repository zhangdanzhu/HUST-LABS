@echo off
set xv_path=D:\\xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto f9a28b421c5342cd9677abae5440d986 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot moore_sequence_detecor_tb_behav xil_defaultlib.moore_sequence_detecor_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

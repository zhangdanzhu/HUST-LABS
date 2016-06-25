`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/30 14:56:55
// Design Name: 
// Module Name: Parallel_in_serial_out_load_enable_behavior_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Parallel_in_serial_out_load_enable_behavior_tb(
    );
    reg Clk,load,ShiftEn,ShiftIn; 
    reg [3:0] ParallelIn;
    wire ShiftOut;
    wire [3:0] RegContent;
    integer k;
    Parallel_in_serial_out_load_enable_behavior DUT(Clk,ShiftIn,ParallelIn,load,ShiftEn,ShiftOut,RegContent);
    
    initial
    begin
        Clk = 0;load = 0;ShiftEn = 0;ShiftIn = 1;ParallelIn = 0;
    end
    
    initial
    begin
        for (k = 0; k < 30; k = k + 1)
        begin
            #10 Clk = ~Clk;
        end
    end
    
    initial
    begin
        #60 load = 1;
        #20 load = 0;
        #120 load = 1;
        #20 load = 0;
        #55 load = 1;
        #20 load = 0;
    end

    initial
    begin
        #100 ShiftEn = 1;
    end

    initial
    begin
        #20 ParallelIn = 5;
        #160 ParallelIn = 9;
    end
endmodule

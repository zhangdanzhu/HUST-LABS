`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/28 09:17:42
// Design Name: 
// Module Name: delay_line1_tb
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


module delay_line1_tb(

    );
    reg Clk, ShiftIn;
    wire ShiftOut;
    integer k;
    delay_line1_behavior DUT (Clk,ShiftIn,ShiftOut);
    initial
    begin
        Clk = 0;ShiftIn = 0;
    end
    initial
    begin
        for (k = 0;k < 16;k = k + 1)
            Clk = ~Clk;
    end
    initial
    begin
        #20 ShiftIn = 1;
        #40 ShiftIn = 0;
        #20 ShiftIn = 1;
        #40 ShiftIn = 0;
    end
    
endmodule

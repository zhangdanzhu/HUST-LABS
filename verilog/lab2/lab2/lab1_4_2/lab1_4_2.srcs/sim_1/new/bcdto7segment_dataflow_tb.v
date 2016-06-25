`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/25 22:40:43
// Design Name: 
// Module Name: bcdto7segment_dataflow_tb
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


module bcdto7segment_dataflow_tb(
    );
    reg [3:0] x;
    reg [3:0] an;
    wire [6:0] seg;
    
    bcdto7segment_dataflow DUT (x,an,seg);
    initial
    begin
        x=0;
        #10 x=1;
        #10 x=2;
        #10 x=3;
        #10 x=4;
        #10 x=5;
        #10 x=6;
        #10 x=7;
        #10 x=8;
        #10 x=9;
        #10 x=10;
        #10 x=11;
        #10 x=12;
        #10 x=16;
        #10 x=17;
        #10 x=18;
    end
    
endmodule

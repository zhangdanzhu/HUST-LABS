`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 20:06:24
// Design Name: 
// Module Name: register
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


module Register(d,clk,q,reset);
    parameter WIDTH = 8;
    input [WIDTH-1:0] d;
    output reg [WIDTH-1:0] q;
    input clk,reset;
    always@(posedge clk)
        if (reset)
            q <= 0;
        else
            q <= d;
endmodule

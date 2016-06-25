`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 22:26:44
// Design Name: 
// Module Name: Register
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


module Register(d,clk,q,reset,load);
    parameter WIDTH = 8;
    input [WIDTH-1:0] d;
    output reg [WIDTH-1:0] q;
    input clk,reset,load;
    always@(load or reset)
        if (reset)
            q <= 0;
        else if (load)
            q <= d;
endmodule

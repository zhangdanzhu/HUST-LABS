`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 22:24:38
// Design Name: 
// Module Name: MUX21
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


module MUX21(zero,one,s,result);
    parameter WIDTH = 8;
    input [WIDTH-1:0] zero,one;
    input s;
    output [WIDTH-1:0] result;
    assign result = s ? one : zero;
endmodule

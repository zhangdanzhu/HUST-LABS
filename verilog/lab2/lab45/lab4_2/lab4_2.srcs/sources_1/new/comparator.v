`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 22:29:32
// Design Name: 
// Module Name: comparator
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


module comparator(num,result);
    parameter WIDTH = 8;
    input [WIDTH-1:0] num;
    output reg result;
    always@(num)
        if (num == 0)
            result = 1;
        else
            result = 0;
endmodule

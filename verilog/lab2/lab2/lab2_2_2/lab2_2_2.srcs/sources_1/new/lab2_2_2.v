`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 15:11:55
// Design Name: 
// Module Name: lab2_2_2
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


module lab2_2_2(
    input [3:0] x,
    output [4:0] y
    );
    wire [4:0] y;
    assign y[4] = ((~x[3])&x[2]&x[1])|(x[3]&(~x[2])&(~x[1]));
    assign y[3] = ((~x[3])&x[2]&(~x[1]))|(x[3]&(~x[2])&(~x[1])&x[0])|((~x[3])&(~x[2])&x[1]&x[0]);
    assign y[2] = ((~x[3])&(~x[1])&x[0])|(x[3]&(~x[2])&(~x[1])&(~x[0]))|((~x[3])&(~x[2])&x[1]&(~x[0]));
    assign y[1] = ((~x[3])&(~x[1])&(~x[0]))|((~x[3])&x[2]&x[1]&x[0])|((~x[3])&(~x[2])&x[1]&(~x[0]));
    assign y[0] = ((~x[3])&(~x[2])&(~x[1]))|((~x[3])&(~x[2])&x[0])|((~x[3])&x[2]&x[1]&(~x[0]));
endmodule

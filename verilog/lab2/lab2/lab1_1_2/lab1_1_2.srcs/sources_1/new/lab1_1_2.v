`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/23 20:11:47
// Design Name: 
// Module Name: lab1_1_2
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


module lab1_1_2(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
    not
      n1(s_n,s);
    and
      an1(a1,x[0],s_n),
      an2(a2,x[1],s_n),
      an3(b1,y[0],s),
      an4(b2,y[1],s);
    or
      o1(m[0],a1,b1),
      o2(m[1],a2,b2);
endmodule

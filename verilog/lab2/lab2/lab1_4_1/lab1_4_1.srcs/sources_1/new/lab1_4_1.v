`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/25 19:36:28
// Design Name: 
// Module Name: lab1_4_1
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


module lab1_4_1(
    input u,v,w,s0,s1,
    output m
    );
    wire m0;
    gate_level_2to1 u1_gl2t1(u,v,s0,m0);
    gate_level_2to1 u2_gl2t1(m0,w,s1,m);
    
endmodule

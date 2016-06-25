`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 19:59:53
// Design Name: 
// Module Name: lab4_1
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


module lab4_1(
    input s0,s1,s2,s3,clk,reset,
    output R0,R1,ACC,SUM,M0,M1,M2,M3
    );
    parameter WIDTH0 = 16;
    wire [WIDTH0-1:0] ACC,R0,R1,SUM,M0,M1,M2,M3;
    
    Register #(WIDTH0) uReg0(.d(M0),.clk(clk),.q(R0),.reset(reset));
    Register #(WIDTH0) uReg1(.d(M1),.clk(clk),.q(R1),.reset(reset));
    Register #(WIDTH0) uACC(.d(SUM),.clk(clk),.q(ACC),.reset(reset));
    
    adder #(WIDTH0) uadd(.a(ACC),.b(M2),.sum(SUM));
    
    MUX21 #(WIDTH0) uMAX0(.zero(M3),.one(R0),.s(s0),.result(M0));
    MUX21 #(WIDTH0) uMAX1(.zero(M3),.one(R1),.s(s1),.result(M1));
    MUX21 #(WIDTH0) uMAX2(.zero(R0),.one(R1),.s(s2),.result(M2));
    MUX21 #(WIDTH0) uMAX3(.zero(M2),.one(ACC),.s(s3),.result(M3));
endmodule

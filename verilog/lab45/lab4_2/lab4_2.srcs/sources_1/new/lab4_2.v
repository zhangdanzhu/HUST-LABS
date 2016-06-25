`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 21:59:54
// Design Name: 
// Module Name: lab4_2
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


module lab4_2(
    input SUM_SEL,NEXT_SEL,A_SEL,LD_NEXT,LD_SUM,
    output NEXT_ZERO
    );
    parameter WIDTH0 = 16;
    wire [WIDTH0-1:0] SUM1,SUM2,R_SUM,R_NEXT,M_SUM,M_NEXT,M_A,ROM_D;
    wire NEXT_ZERO;
    
    Register #(WIDTH0) uR_SUM(.d(M_SUM),.clk(1),.q(R_SUM),.reset(0),.load(LD_SUM));
    Register #(WIDTH0) uR_NEXT(.d(M_NEXT),.clk(1),.q(R_NEXT),.reset(0),.load(LD_NEXT));
    
    adder #(WIDTH0) uadd1(.a(ROM_D),.b(R_SUM),.sum(SUM1));
    adder #(WIDTH0) uadd2(.a(R_NEXT),.b(1),.sum(SUM2));
    
    MUX21 #(WIDTH0) uMAX0(.zero(0),.one(SUM1),.s(SUM_SEL),.result(M_SUM));
    MUX21 #(WIDTH0) uMAX1(.zero(0),.one(ROM_D),.s(NEXT_SEL),.result(M_NEXT));
    MUX21 #(WIDTH0) uMAX2(.zero(R_NEXT),.one(SUM2),.s(A_SEL),.result(M_A));
    
    comparator #(WIDTH0) uc1(.num(M_NEXT),.result(NEXT_ZERO));
    
    rom #(WIDTH0) ur1(.A(M_A),.D(ROM_D));
endmodule

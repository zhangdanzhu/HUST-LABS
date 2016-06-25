`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 20:26:09
// Design Name: 
// Module Name: lab5_1_2
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


module lab5_1_2(
    input R,
    input S,
    input E,
    output Q,
    output Qbar
    );
    wire a,b;
    assign #2 a = R&E;
    assign #2 b = S&E;
    SR_latch_dataflow u_sr(a,b,Q,Qbar);
endmodule

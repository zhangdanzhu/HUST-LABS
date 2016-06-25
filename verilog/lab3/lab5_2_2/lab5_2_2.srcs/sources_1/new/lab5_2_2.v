`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 21:58:05
// Design Name: 
// Module Name: lab5_2_2
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


module lab5_2_2(
    input Clock,
    input D,
    output Qa,
    output Qb,
    output Qc
    );
    wire Qa,Qb,Qc,Qabar;
    D_latch_dataflow u_D(D,Clock,Qa,Qabar);
    D_ff_behavior u_D_ffpos(D,Clock,Qb);
    D_ff_behavior_neg u_D_ffneg(D,Clock,Qc);
endmodule

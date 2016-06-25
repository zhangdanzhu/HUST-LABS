`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 16:15:06
// Design Name: 
// Module Name: rca_dataflow
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


module rca_dataflow(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output cout,
    output [3:0] s
    );
    
    fulladder_dataflow u1_fa(a[0],b[0],cin,s[0],cout0);
    fulladder_dataflow u2_fa(a[1],b[1],cout0,s[1],cout1);
    fulladder_dataflow u3_fa(a[2],b[2],cout1,s[2],cout2);
    fulladder_dataflow u4_fa(a[3],b[3],cout2,s[3],cout);
    
endmodule

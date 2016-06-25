`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 17:09:04
// Design Name: 
// Module Name: lab2_3_2
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


module lab2_3_2(
    input [4:0] a,
    input [4:0] b,
    input cin,
    output cout,
    output z,
    output [6:0] seg
    );
    
     reg [3:0] an;
     wire [3:0] tmp,s;
     wire z;
     rca_dataflow u_dataflow(a,b,cin,cout,s);
     lab2_2_1_partA u_partA(s,z,tmp);
     bcdto7segment_dataflow u_bcdto7(tmp,an,seg);
    
endmodule

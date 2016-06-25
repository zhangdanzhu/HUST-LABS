`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 10:03:08
// Design Name: 
// Module Name: lab2_2_1
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


module lab2_2_1(
    input [3:0] v,
    output [6:0] seg
    );
    reg [3:0] an;
    wire [3:0] tmp;
    wire z;
    lab2_2_1_partA u_partA(v,z,tmp);
    bcdto7segment_dataflow u_bcdto7(tmp,an,seg);
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 07:47:24
// Design Name: 
// Module Name: lab2_2_1_partA
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


module lab2_2_1_partA(
    input [3:0] v,
    output z,
    output [3:0] m_out
    );
    wire [3:0] c;
    comparator_dataflow u_cd(v,z);
    lab2_circuitA_dataflow u_lcd(v,c);
    
    mux_2to1 u1_m2t1(v[3],0,z,m_out[3]);
    mux_2to1 u2_m2t1(v[2],c[2],z,m_out[2]);
    mux_2to1 u3_m2t1(v[1],c[1],z,m_out[1]);
    mux_2to1 u4_m2t1(v[0],c[0],z,m_out[0]);
    
endmodule

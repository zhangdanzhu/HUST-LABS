`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/23 19:27:34
// Design Name: 
// Module Name: lab1_1_1
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


module mux_2to1(x,y,s,m);
    input x,y,s;
    output m;
    wire s_n;
    wire x_and_sn,s_and_y;
    not
        un1(s_n,s);
    and
        ua1(x_and_sn,x,s_n),
        ua2(s_and_y,s,y);
    or
        uo1(m,x_and_sn,s_and_y);
endmodule

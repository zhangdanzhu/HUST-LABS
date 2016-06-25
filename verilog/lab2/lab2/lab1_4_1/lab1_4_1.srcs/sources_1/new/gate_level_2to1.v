`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/25 20:32:44
// Design Name: 
// Module Name: gate_level_2to1
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


module gate_level_2to1(x,y,s,m);
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


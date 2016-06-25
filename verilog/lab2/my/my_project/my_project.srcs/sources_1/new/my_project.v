`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 18:26:21
// Design Name: 
// Module Name: my_project
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


module my_project(
    input a,
    input b,
    input c,
    output f
    );
    wire p1,p2,p3,p4,p5;
    not
        u_na(p1,a);
    or
        u_borc(p2,b,c);
    nand
        u_bc(p3,b,c),
        u_ap3(p5,p3,a),
        u_p1p2(p4,p1,p2),
        u_p4p5(f,p4,p5);
        
    
endmodule

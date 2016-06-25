`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 17:25:18
// Design Name: 
// Module Name: jiance
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


module jiance(
    input x,
    input cp,reset,
    output z,y2,y1
    );
    wire x1,a1,a2,na1,na2;    
    xor 
        ux1(x1,y2,y1);       
    and 
        ua1(z,x,y2,y1),
        ua2(a2,x1,~x);
    nand
        una1(na1,~x,na2),
        una4(na2,~y1,y2);            
    d_ff d_ff_2(y2,cp,a2,reset);
    d_ff d_ff_1(y1,cp,na1,reset);    
endmodule

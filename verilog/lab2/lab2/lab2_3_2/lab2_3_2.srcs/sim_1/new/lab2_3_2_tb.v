`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 17:31:52
// Design Name: 
// Module Name: lab2_3_2_tb
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


module lab2_3_2_tb();
    
    reg[3:0] a,b;
    reg cin;
    wire cout,z;
    wire [6:0] seg;
    integer k;
    lab2_3_2 DUT(a,b,cin,cout,z,seg);
    
    initial
    begin
        a=0;b=0;cin=0;
        for (k = 1;k<7;k=k+1)
            begin
                a = k;
                b = k+3;
                #10;
            end
        cin = 1;
        for (k = 1;k<7;k=k+1)
            begin
                a = k;
                b = k+3;
                #10;
            end        
    end
endmodule

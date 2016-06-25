`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 14:15:55
// Design Name: 
// Module Name: lab2_2_1_tb
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


module lab2_2_1_tb(
    );
    reg [3:0] v;
    integer k;
    wire [6:0] seg;
    lab2_2_1 DUT (v,seg);
    initial
    begin
        for(k=0;k<10;k=k+1)
            begin
                v = k;
                #20 ;
            end
    end
endmodule

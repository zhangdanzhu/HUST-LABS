`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 15:32:57
// Design Name: 
// Module Name: lab2_2_2_tb
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


module lab2_2_2_tb(
    );
    reg [3:0] x;
    integer k;
    wire [4:0] y;
    lab2_2_2 DUT (x,y);
    
    initial
    begin
        for (k = 0; k < 10; k=k+1)
        begin
            x = k;
            #20;
        end
    end
endmodule

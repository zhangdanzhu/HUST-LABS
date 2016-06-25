`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/25 23:53:34
// Design Name: 
// Module Name: lab2_1_1_tb
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


module lab2_1_1_tb(
    );
    reg [3:0] an;
    wire [6:0] m;
    lab2_1_1 DUT (an,m);
    initial
    begin
        an = 1;
    end
endmodule

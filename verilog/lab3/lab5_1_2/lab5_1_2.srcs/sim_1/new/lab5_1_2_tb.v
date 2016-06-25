`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 20:36:35
// Design Name: 
// Module Name: lab5_1_2_tb
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


module lab5_1_2_tb(
    );
    reg R,S,E;
    wire Q,Qbar;
    lab5_1_2 DUT (R,S,E,Q,Qbar);
    initial
    begin
        E = 0;S = 0;R = 0;
        #10 S =1;
        #10 E = 1;
        #10 S = 0;
        #10 R = 1;
        #10 E = 0;
        #10 R = 0;S = 1;
        #10 R = 1;S = 0;
        #10 R = 0;S = 1;
        #10 E = 1;
        #10 R = 1;S = 0;
    end 
endmodule

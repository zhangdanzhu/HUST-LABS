`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 22:50:25
// Design Name: 
// Module Name: lab5_2_2_tb
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


module lab5_2_2_tb(
    );
    reg Clock,D;
    wire Qa,Qb,Qc;
    lab5_2_2 DUT(Clock,D,Qa,Qb,Qc);
    
    initial
    begin
        Clock = 0;D = 0;
        #50 D = 1;
        #10 Clock = 1;
        #10 D = 0;
        #10 D = 1;
        #20 D = 0;
        #20 Clock = 0;
        #10 D = 1;
        #20 D = 0;
        #10 D = 1;
        #10 D = 0;
        #10 Clock = 1;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #30 Clock = 0;
        #10 D = 0;
         
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 20:52:41
// Design Name: 
// Module Name: lab4_1_tb
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


module lab4_1_tb();
    reg s0,s1,s2,s3,clk,reset;
    wire [15:0] RO,R1,ACC,SUM,M0,M1,M2,M3;
    integer k;
    lab4_1 DUT (s0,s1,s2,s3,clk,reset,RO,R1,ACC,SUM,M0,M1,M2,M3);
    
    initial
    begin
        s0=0;s1=0;s2=0;s3=0;clk=0;reset=1;
        #12 reset = 0;
        #50 s3 = 1;
        #50 s2 = 1;
        #50 s1 = 1;
        #50 s0 = 1;
    end
    
    initial
    begin
        for (k = 0; k < 300; k = k + 1)
            #10 clk = ~clk;
    end
    
endmodule

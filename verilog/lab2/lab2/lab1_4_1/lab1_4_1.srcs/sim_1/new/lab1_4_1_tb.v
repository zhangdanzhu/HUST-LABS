`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/25 19:38:08
// Design Name: 
// Module Name: lab1_4_1_tb
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


module lab1_4_1_tb(
    );
    reg u,v,w,s0,s1;
    wire m;
    lab1_4_1 DUT(u,v,w,s0,s1,m);
    
    initial
    begin
        s1=0;s0=0;u=0;v=0;w=0;
        #10 w=1;
        #10 s0=1;
        #10 s1=1;s0=0;
        #10 s1=1;s0=1;
        #10 s1=0;s0=0;v=1;w=0;
        #10 s0=1;
        #10 s1=1;s0=0;
        #10 s1=1;s0=1;        
        
        #10 s1=0;s0=0;w=1;
        #10 s0=1;
        #10 s1=1;s0=0;
        #10 s1=1;s0=1;        
        
        #10 s1=0;s0=0;u=1;v=0;w=0;
        #10 s0=1;
        #10 s1=1;s0=0;
        #10 s1=1;s0=1;        
        
        #10 s1=0;s0=0;w=1;
        #10 s0=1;
        #10 s1=1;s0=0;
        #10 s1=1;s0=1;        
        
        #10 s1=0;s0=0;v=1;w=0;
        #10 s0=1;
        #10 s1=1;s0=0;
        #10 s1=1;s0=1;        
        
        #10 s1=0;s0=0;w=1;
        #10 s0=1;
        #10 s1=1;s0=0;
        #10 s1=1;s0=1;       
    end
endmodule

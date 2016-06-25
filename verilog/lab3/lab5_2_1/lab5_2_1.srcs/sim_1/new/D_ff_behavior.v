`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 21:38:55
// Design Name: 
// Module Name: D_ff_behavior
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


module D_ff_behavior_tb(

    );
    reg Clk, D;
    wire Q;
    
    D_ff_behavior DUT(D,Clk,Q);
    
    initial
    begin
        Clk = 0;D = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;D = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;D = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;D = 1;
        #10 Clk = 1;
        #10 Clk = 0;D = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        
    end
    
endmodule

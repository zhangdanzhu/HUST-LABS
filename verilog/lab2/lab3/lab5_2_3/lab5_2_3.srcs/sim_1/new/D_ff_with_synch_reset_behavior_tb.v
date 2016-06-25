`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 23:11:51
// Design Name: 
// Module Name: D_ff_with_synch_reset_behavior_tb
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


module D_ff_with_synch_reset_behavior_tb(

    );
    wire Q;
    reg Clk,D,reset;
    
    D_ff_with_synch_reset_behavior DUT(D,Clk,reset,Q);
    initial
    begin
        Clk = 0;D = 0;reset = 0;
        #10 Clk = 1;
        #10 Clk = 0;D = 1;
        #10 Clk = 1;
        #5 reset = 1;
        #5 Clk = 0;reset = 0;
        #5 reset = 1;
        #5 Clk = 1;
        #5 reset = 0;
        #5 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #5 D = 0;
        #2 reset = 1;
        #3 Clk = 1;
        #2 reset = 0;
        
    end
    
endmodule

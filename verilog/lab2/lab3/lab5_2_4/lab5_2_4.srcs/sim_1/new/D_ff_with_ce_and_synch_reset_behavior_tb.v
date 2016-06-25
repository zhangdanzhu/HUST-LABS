`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 23:39:18
// Design Name: 
// Module Name: D_ff_with_ce_and_synch_reset_behavior_tb
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


module D_ff_with_ce_and_synch_reset_behavior_tb(
    );
    reg D,Clk,ce,reset;
    wire Q;
    integer k;
    D_ff_with_ce_and_synch_reset_behavior DUT(D,Clk,reset,ce,Q);
    
    initial
    begin
        D = 0;Clk = 0;ce = 0;reset = 0;       
    end
     
    initial
    begin
        #20 D = 1;
        #80 D = 0;
        #120 D = 1;
    end 
       
    initial
    begin
        for (k = 0;k < 30;k = k + 1)
            #10 Clk = Clk + 1;
    end  
    
    initial
    begin
        #60 ce = 1;
        #20 ce = 0;
        #100 ce = 1;
        #20 ce = 0;
        #60 ce = 1;
        #20 ce = 0;
    end
    
    initial
    begin
        #120 reset = 1;
        #20 reset = 0;
    end
    
endmodule

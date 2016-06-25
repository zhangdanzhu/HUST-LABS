`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 23:30:01
// Design Name: 
// Module Name: D_ff_with_ce_and_synch_reset_behavior
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


module D_ff_with_ce_and_synch_reset_behavior(input D, input Clk, input reset, input ce, output reg Q);    
    always @(posedge Clk)       
        if (reset)        
        begin          
            Q <= 1'b0;       
        end else if (ce)       
        begin          
            Q <= D;       
        end 
endmodule

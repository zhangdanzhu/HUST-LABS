`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 23:10:07
// Design Name: 
// Module Name: D_ff_with_synchronous_reset
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


module D_ff_with_synch_reset_behavior(input D, input Clk, input reset, output reg Q);    
    always @(posedge Clk)       
        if (reset)        
        begin          
            Q <= 1'b0;       
        end else        
        begin          
            Q <= D;       
        end 
endmodule

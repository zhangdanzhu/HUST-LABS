`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/28 08:54:24
// Design Name: 
// Module Name: Register_with_synch_reset_set_load_behavior
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


module Register_with_synch_reset_set_load_behavior(input [3:0] D, input Clk, input reset,input set,input load, output reg [3:0] Q);    
    always @(posedge Clk)       
        if (reset)        
        begin          
            Q <= 4'b0;
        end else if (set)
        begin
            Q <= 4'b1111;      
        end else if (load)       
        begin         
            Q <= D;       
        end 
endmodule
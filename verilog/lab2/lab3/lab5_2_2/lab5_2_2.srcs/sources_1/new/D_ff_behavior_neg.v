`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 21:30:56
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


module D_ff_behavior_neg(
    input D,
    input Clk,
    output reg Q
    );
    
    always @ (negedge Clk)
    begin
        Q <= D;
    end
    
endmodule
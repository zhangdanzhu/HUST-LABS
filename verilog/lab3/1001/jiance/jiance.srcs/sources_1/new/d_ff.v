`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 17:26:20
// Design Name: 
// Module Name: d_ff
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


module d_ff(
    output reg q,
    input clk,
    input d,
    input reset
    );
    always@(posedge clk)
    begin
        if (reset)
        begin
            q = 0;
        end
        else
        begin
            q = d;
        end
    end
endmodule

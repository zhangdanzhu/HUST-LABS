`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 20:41:53
// Design Name: 
// Module Name: counter_rom
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


module counter_rom(
    input clk,reset,
    output [2:0] yout,
    output [2:0] state,nextstate
    );
    reg [2:0] state;
    wire [2:0] nextstate;      
    always @(posedge clk or posedge reset) // always block to update state 
    if (reset)       
        state <= 0; 
    else      
        state <= nextstate;   

    // compute output & nextstate
    next_out_rom urom({yout,nextstate},state);
endmodule

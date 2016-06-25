`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/30 15:28:37
// Design Name: 
// Module Name: 2_bit_comparator
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


module two_2_bit_comparator(
    input [1:0] a,
    input [1:0] b,
    output lt,
    output gt,
    output eq
    );
    wire lt,gt,eq;
    reg [2:0] ROM [0:15];  // defining 16x3 ROM 
    assign {lt,gt,eq} = ROM[{a,b}];
    initial $readmemb ("ROM_data.txt", ROM, 0, 15);   // load ROM content from ROM_data.txt file    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/30 20:49:20
// Design Name: 
// Module Name: two_2_bit_multiplier
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


module two_2_bit_multiplier(
    input [1:0] a,b,
    output wire [3:0] product
    );
    reg [3:0] ROM [0:15]; // defining 16x4 ROM
    assign product = ROM[{a,b}]; // reading ROM content at the address
    initial $readmemb ("ROM_data.txt", ROM, 0, 15); // load ROM content fromROM_data.txt file
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 20:42:31
// Design Name: 
// Module Name: next_out_rom
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


module next_out_rom (ROM_data, ROM_addr);   
    output [5:0] ROM_data;   
    input [3:0] ROM_addr; 
    reg [5:0] ROM [15:0];  // defining 16x6 ROM 
    assign ROM_data = ROM[ROM_addr]; // reading ROM content at the address ROM_addr  
    initial $readmemb ("C:\\Users\\pc\\Desktop\\lab45\\lab5_1_3 - ¸±±¾\\lab5_1_3.srcs\\sources_1\\new\\ROM_data.txt", ROM, 0, 15);   // load ROM content from ROM_data.txt file 
endmodule 

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 22:31:43
// Design Name: 
// Module Name: rom
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


module rom (D, A); 
    parameter WIDTH = 8;  
    output [WIDTH-1:0] D;   
    input [WIDTH-1:0] A; 
    reg [WIDTH-1:0] ROM [(2**WIDTH)-1:0];  // defining 2^WIDTH * WIDTH ROM 
    assign D = ROM[A]; // reading ROM content at the address ROM_addr  
    initial $readmemb ("C:\\Users\\pc\\Desktop\\lab45\\lab4_2\\lab4_2.srcs\\sources_1\\new\\ROM_data.txt", ROM, 0, (2**WIDTH)-1);   // load ROM content from ROM_data.txt file 
endmodule 

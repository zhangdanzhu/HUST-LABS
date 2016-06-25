`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/30 15:30:13
// Design Name: 
// Module Name: two_2_bit_comparator_tb
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


module two_2_bit_multiplier_tb(

    );
    reg [1:0] a,b;
    wire [3:0] product;   
    two_2_bit_multiplier DUT(a,b,product);
    
    initial
    begin
        a = 0;b = 0;
        #10 a = 1;
        #10 a = 2;
        #10 a = 3;
        #10 a = 0;b = 1;
        #10 a = 1;
        #10 a = 2;
        #10 a = 3;
        #10 a = 0;b = 2;
        #10 a = 1;
        #10 a = 2;
        #10 a = 3;
        #10 a = 0;b = 3;
        #10 a = 1;
        #10 a = 2;
        #10 a = 3;                
    end
endmodule

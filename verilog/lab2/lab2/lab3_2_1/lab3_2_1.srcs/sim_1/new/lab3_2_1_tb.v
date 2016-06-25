`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 21:37:36
// Design Name: 
// Module Name: lab3_2_1_tb
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


module lab3_2_1_tb(
    
    );
    
    reg [7:0] v; 
    reg en_in_n; 
    wire [2:0] y; 
    wire en_out,gs;       
    integer k;       
    lab3_2_1 DUT(v,en_in_n,y,en_out,gs); 
      
    initial 
    begin 
        for (k=0; k < 511; k=k+16) 
            begin 
                #50 {en_in_n,v} = i; 
            end 
    end
endmodule

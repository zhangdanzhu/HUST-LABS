`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 20:15:13
// Design Name: 
// Module Name: moore_sequence_detecor_tb
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


module moore_sequence_detecor_tb(
    );
    wire yout;
    reg clk,reset;
    reg [1:0] ain;
    integer k;
    moore_sequence_detecor DUT(.ain(ain),.clk(clk),.reset(reset),.yout(yout));
    
    initial
    begin
        clk = 0; reset = 1; ain = 0;
    end
    initial
    begin
        for (k = 0; k < 50; k = k + 1)
            #5 clk = ~clk;
    end
    initial
    begin
        #20 reset = 0;
        #150 reset = 1;
        #10 reset = 0;
    end
    initial
    begin
        #40 ain = 3;
        #10 ain = 2;
        #10 ain = 0;
        #20 ain = 2;
        #10 ain = 0;
        #10 ain = 3;
        #10 ain = 0;
        #10 ain = 1;
        #10 ain = 0;
        #10 ain = 2;
        #10 ain = 3;
        #10 ain = 0;
        #30 ain = 2;
        #20 ain = 0;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 14:22:19
// Design Name: 
// Module Name: mealy_sequence_detector_tb
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


module mealy_sequence_detector_tb();
    wire yout;
    wire [3:0] count;
    reg clk,reset,ain;
    wire [1:0] state,nextstate;
    integer k;
    moore_sequence_detector DUT(.clk(clk),.reset(reset),.count(count),.yout(yout),.ain(ain),.state(state),.nextstate(nextstate));
    initial
    begin
        clk = 0;reset = 1;ain = 0;
    end
    initial
    begin
        for (k = 0; k < 25; k = k + 1)
            #5 clk = ~clk;
    end
    initial
    begin
        #10 reset = 0;
    end
    initial
    begin
        #20 ain = 1;
        #10 ain = 0;
        #10 ain = 1;
        #20 ain = 0;
        #10 ain = 1;
        #30 ain = 0;
        #10 ain = 1;
    end
endmodule

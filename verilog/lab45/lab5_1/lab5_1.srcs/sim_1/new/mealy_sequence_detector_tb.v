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
    mealy_sequence_detector DUT(.clk(clk),.reset(reset),.count(count),.yout(yout),.ain(ain),.state(state),.nextstate(nextstate));
    initial
    begin
        clk = 0;reset = 1;ain = 0;
    end
    initial
    begin
        for (k = 0; k < 70; k = k + 1)
            #5 clk = ~clk;
    end
    initial
    begin
        #20 reset = 0;
        #170 reset = 1;
        #10 reset = 0;
    end
    initial
    begin
        #40 ain = 1;
        #20 ain = 0;
        #60 ain = 1;
        #40 ain = 0;
        #20 ain = 1;
        #30 ain = 0;
        #30 ain = 1;
    end
endmodule

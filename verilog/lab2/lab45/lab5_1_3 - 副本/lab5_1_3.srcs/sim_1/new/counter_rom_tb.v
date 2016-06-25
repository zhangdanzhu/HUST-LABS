`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 21:10:51
// Design Name: 
// Module Name: counter_rom_tb
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


module counter_rom_tb(
    );
    wire [2:0] yout;
    wire [2:0] state,nextstate;
    reg INPUT,clk,reset;
    integer k;
    counter_rom DUT(.INPUT(INPUT),.clk(clk),.reset(reset),.yout(yout),.state(state),.nextstate(nextstate));
    
    initial
    begin
        clk = 0; INPUT = 0; reset = 1;
    end
    initial
    begin
        for (k = 0; k < 60; k = k + 1)
            #5 clk = ~clk;
    end
    initial
    begin
        #10 reset = 0;
        #200 reset = 1;
        #10 reset = 0;
    end
    initial
    begin
        for (k = 0; k < 30; k = k + 1)
            #10 INPUT = ~INPUT;
    end    
endmodule

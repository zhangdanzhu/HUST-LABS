`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/28 00:42:28
// Design Name: 
// Module Name: Register_with_synch_reset_load_behavior_tb
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


module Register_with_synch_reset_set_load_tb(
    );
    reg Clk,load,reset,set;
    reg [3:0] D;
    wire [3:0] Q;
    integer k;
    Register_with_synch_reset_set_load_behavior DUT(D,Clk,reset,set,load,Q);
    initial
    begin
        Clk = 0;load = 0;reset = 0;D = 0;
        #5 set = 1;
        #10 set = 0;
    end
    initial
    begin
        for (k = 0;k < 30;k=k+1)
            #10 Clk = Clk + 1;
    end
    initial
    begin
        #60 load = 1;
        #20 load = 0;
        #40 load = 1;
        #20 load = 0;
        #55 load = 1;
        #20 load = 0;
        #65 load = 1;
    end
    initial
    begin
        #155 reset = 1;
        #85 reset = 0;  
    end
    initial
    begin
        #20 D = 5;
        #60 D = 9;
    end
endmodule

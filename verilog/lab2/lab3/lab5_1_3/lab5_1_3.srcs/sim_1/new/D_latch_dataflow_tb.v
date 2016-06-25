`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 21:22:47
// Design Name: 
// Module Name: D_latch_dataflow_tb
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


module D_latch_dataflow_tb(
    );
    reg D,E;
    wire Q,Qbar;
    D_latch_dataflow DUT (D,E,Q,Qbar);
    
    initial
    begin
        D = 0;E = 0;
        #10 D = 1;
        #10 E = 1;
        #10 D = 0;
        #10 D = 1;
        #10 E = 0;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #10 E = 1;
        #10 D = 1;
        #10 D = 0;
       
    end
    
endmodule

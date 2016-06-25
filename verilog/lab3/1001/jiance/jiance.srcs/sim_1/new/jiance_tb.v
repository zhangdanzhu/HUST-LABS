`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 17:34:55
// Design Name: 
// Module Name: jiance_tb
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


module jiance_tb(

    );
    
    reg cp,x;
    wire z,y2,y1;
    reg reset;
    integer k;
    jiance DUT(x,cp,reset,z,y2,y1);
    
    initial
    begin
        cp=0;x=0;reset=0;
        #5 reset = 1;
        #10 reset = 0;
    end
    initial
    begin
        for (k = 0;k < 20; k = k + 1)
            #10 cp = ~cp;
    end
    initial
    begin
        #20 x = 1;
        #20 x = 0;
        #20 x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 x = 0;
        #20 x = 1;   
    end
endmodule

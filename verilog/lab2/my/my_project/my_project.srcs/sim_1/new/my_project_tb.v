`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 18:39:03
// Design Name: 
// Module Name: my_project_tb
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


module my_project_tb(

    );
    reg a,b,c;
    wire f;
    my_project DUT(a,b,c,f);
    initial
    begin
        a = 0;b = 0;c = 0;
        #10 c = 1;
        #10 b=1;c=0;
        #10 c = 1;
        #10 a = 1;b = 0;c =0;
        #10 c = 1;
        #10 b=1;c=0;
        #10 c = 1;       
    end
endmodule

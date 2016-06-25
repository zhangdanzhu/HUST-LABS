`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/26 16:22:48
// Design Name: 
// Module Name: rca_dataflow_tb
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


module rca_dataflow_tb(

    );
    reg [3:0] a, b;
    reg cin;
    wire cout;
    wire [3:0] s;
       
    rca_dataflow DUT (.a(a), .b(b), .cin(cin), .cout(cout), .s(s));
       
    
       initial
       begin
         a = 0; b = 0; cin = 0;
       #10 a = 3;
       #10 b = 2;
       #10 a = 6;
       #10 cin = 1; a = 0; b = 0;
       #10 a = 8;
       #10 b = 4;
       #10 a = 1;
       #10;
       end
   
   endmodule

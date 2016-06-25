`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/05/27 21:18:01
// Design Name: 
// Module Name: D_latch_dataflow
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


module D_latch_dataflow(
    input D,
    input E,
    output Q,
    output Qbar
    );
    
    assign #2 Q = ~(((~D)&E) | Qbar);
    assign #2 Qbar = ~((D&E) | Q);
    
endmodule

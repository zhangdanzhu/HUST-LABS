`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 18:06:06
// Design Name: 
// Module Name: moore_sequence_detecor
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


module moore_sequence_detecor(
    input [1:0] ain,
    input clk,reset,
    output reg yout
    );
    reg [2:0] state, nextstate;     
    parameter S0=0, S1=1, S2=2, S3=3, S11=4, S22=5, S33=6; 
    always @(posedge clk or posedge reset) // always block to update state 
    if (reset)      
        begin 
            state <= S0;
            yout = 0;
        end 
    else      
        state <= nextstate;  
    always @(state)   // always block to compute output 
    begin     
        case(state)        
            S0: ;         
            S1: ;
            S2: ;
            S3: ;
            S11:yout = 0;
            S22:yout = ~yout;
            S33:yout = 1;      
        endcase  
    end 
    always @(state or ain)  // always block to compute nextstate 
    begin     
        nextstate = S0; 
        if(ain == 1)               
            nextstate = S1;
        else if(ain == 2)
            nextstate = S2;
        else if(ain == 3)
            nextstate = S3;
        else
        begin
            case(state)        
                S0: ;        
                S1: if(~ain)    nextstate = S11;    
                S2: if(~ain)    nextstate = S22;                   
                S3: if(~ain)    nextstate = S33;
                S11: ;
                S22: ;
                S33: ;      
            endcase  
        end         
    end 
endmodule

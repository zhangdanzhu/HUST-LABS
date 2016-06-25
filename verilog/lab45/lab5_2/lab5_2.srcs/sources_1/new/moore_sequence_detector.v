`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/10 14:21:24
// Design Name: 
// Module Name: mealy_sequence_detector
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


module moore_sequence_detector(
    input ain,clk,reset,
    output reg [3:0] count,
    output reg yout,
    output [1:0] state,nextstate
    );
    reg [1:0] state, nextstate;     
    parameter S0=0, S1=1, S2=2, S3=3; 
    always @(posedge clk) // always block to update state 
    if (reset)    
    begin   
        state <= S0;
        count <= 0;
    end 
    else      
    begin
        state <= nextstate;
        count <= count + ain;  
    end
        
    always @(state) // always block to compute output 
    begin       
        yout <= 0;
        case(state)       
            S0: ;        
            S1: ;
            S2: ;
            S3: yout <= 1;     
        endcase  
    end 
    
    always @(state or ain) // always block to compute nextstate 
    begin        
        case(state)       
            S0: 
            begin
                if(ain) nextstate <= S1;
                else nextstate <= S0; 
            end        
            S1: 
            begin
                if(ain) nextstate <= S2;
                else nextstate <= S1; 
            end        
            S2: 
            begin
                if(ain) nextstate <= S3;
                else nextstate <= S2; 
            end  
            S3: 
            begin
                if(ain) nextstate <= S1;
                else nextstate <= S3; 
            end                     
        endcase 
     end 
endmodule

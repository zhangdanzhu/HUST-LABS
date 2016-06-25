module delay_line1_behavior(input Clk, input ShiftIn, output ShiftOut);     
    reg shift_reg;  
    always @(posedge Clk)           
        shift_reg <= ShiftIn;     
    assign ShiftOut = shift_reg; 
endmodule
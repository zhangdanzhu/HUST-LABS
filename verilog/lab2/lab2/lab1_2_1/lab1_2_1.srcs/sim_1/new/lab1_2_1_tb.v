`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mux_2bit_2_to_1_dataflow_tb
//////////////////////////////////////////////////////////////////////////////////

module lab1_2_1_tb(
    );
    
    reg [7:0] x_in;
    wire [7:0] y_out;
    
    lab1_2_1 DUT (.x_in(x_in), .y_out(y_out));
    
 
    initial
    begin
      x_in = 0;
      #10 x_in = 1;
      #10 x_in = 2;
      #10 x_in = 4;
      #10 x_in = 8;
      #10 x_in = 16;
      #10 x_in = 32;
      #10 x_in = 64;
      #10 x_in = 128;
    end

endmodule

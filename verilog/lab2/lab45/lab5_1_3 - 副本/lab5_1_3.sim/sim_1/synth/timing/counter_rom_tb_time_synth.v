// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Fri Jun 10 21:28:17 2016
// Host        : acer running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/pc/Desktop/lab45/lab5_1_3/lab5_1_3.sim/sim_1/synth/timing/counter_rom_tb_time_synth.v
// Design      : counter_rom
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module counter_rom
   (INPUT,
    clk,
    reset,
    yout,
    state,
    nextstate);
  input INPUT;
  input clk;
  input reset;
  output yout;
  output [2:0]state;
  output [2:0]nextstate;

  wire INPUT;
  wire INPUT_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [2:0]nextstate;
  wire [2:0]nextstate_OBUF;
  wire reset;
  wire reset_IBUF;
  wire [2:0]state;
  wire [2:0]state_OBUF;
  wire yout;
  wire yout_OBUF;

initial begin
 $sdf_annotate("counter_rom_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF INPUT_IBUF_inst
       (.I(INPUT),
        .O(INPUT_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \nextstate_OBUF[0]_inst 
       (.I(nextstate_OBUF[0]),
        .O(nextstate[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F02)) 
    \nextstate_OBUF[0]_inst_i_1 
       (.I0(INPUT_IBUF),
        .I1(state_OBUF[1]),
        .I2(state_OBUF[2]),
        .I3(state_OBUF[0]),
        .O(nextstate_OBUF[0]));
  OBUF \nextstate_OBUF[1]_inst 
       (.I(nextstate_OBUF[1]),
        .O(nextstate[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hBC04)) 
    \nextstate_OBUF[1]_inst_i_1 
       (.I0(state_OBUF[2]),
        .I1(state_OBUF[1]),
        .I2(INPUT_IBUF),
        .I3(state_OBUF[0]),
        .O(nextstate_OBUF[1]));
  OBUF \nextstate_OBUF[2]_inst 
       (.I(nextstate_OBUF[2]),
        .O(nextstate[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \nextstate_OBUF[2]_inst_i_1 
       (.I0(state_OBUF[0]),
        .I1(state_OBUF[2]),
        .I2(state_OBUF[1]),
        .I3(INPUT_IBUF),
        .O(nextstate_OBUF[2]));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  OBUF \state_OBUF[0]_inst 
       (.I(state_OBUF[0]),
        .O(state[0]));
  OBUF \state_OBUF[1]_inst 
       (.I(state_OBUF[1]),
        .O(state[1]));
  OBUF \state_OBUF[2]_inst 
       (.I(state_OBUF[2]),
        .O(state[2]));
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(nextstate_OBUF[0]),
        .Q(state_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(nextstate_OBUF[1]),
        .Q(state_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(nextstate_OBUF[2]),
        .Q(state_OBUF[2]));
  OBUF yout_OBUF_inst
       (.I(yout_OBUF),
        .O(yout));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    yout_OBUF_inst_i_1
       (.I0(state_OBUF[0]),
        .I1(state_OBUF[1]),
        .I2(INPUT_IBUF),
        .I3(state_OBUF[2]),
        .O(yout_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

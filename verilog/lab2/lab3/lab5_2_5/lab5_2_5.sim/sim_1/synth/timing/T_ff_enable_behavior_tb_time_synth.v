// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sat May 28 15:34:43 2016
// Host        : WIN-PJB66N1GE30 running 64-bit major release  (build 7600)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/pc/Desktop/lab3/lab5_2_5/lab5_2_5.sim/sim_1/synth/timing/T_ff_enable_behavior_tb_time_synth.v
// Design      : T_ff_enable_behavior
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module T_ff_enable_behavior
   (Clk,
    reset_n,
    T,
    ce,
    Q);
  input Clk;
  input reset_n;
  input T;
  input ce;
  output Q;

  wire Clk;
  wire Clk_IBUF;
  wire Clk_IBUF_BUFG;
  wire Q;
  wire Q_OBUF;
  wire Q_i_1_n_0;
  wire T;
  wire T_IBUF;
  wire ce;
  wire ce_IBUF;
  wire reset_n;
  wire reset_n_IBUF;

initial begin
 $sdf_annotate("T_ff_enable_behavior_tb_time_synth.sdf",,,,"tool_control");
end
  BUFG Clk_IBUF_BUFG_inst
       (.I(Clk_IBUF),
        .O(Clk_IBUF_BUFG));
  IBUF Clk_IBUF_inst
       (.I(Clk),
        .O(Clk_IBUF));
  OBUF Q_OBUF_inst
       (.I(Q_OBUF),
        .O(Q));
  LUT4 #(
    .INIT(16'h2888)) 
    Q_i_1
       (.I0(reset_n_IBUF),
        .I1(Q_OBUF),
        .I2(T_IBUF),
        .I3(ce_IBUF),
        .O(Q_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    Q_reg
       (.C(Clk_IBUF_BUFG),
        .CE(1'b1),
        .D(Q_i_1_n_0),
        .Q(Q_OBUF),
        .R(1'b0));
  IBUF T_IBUF_inst
       (.I(T),
        .O(T_IBUF));
  IBUF ce_IBUF_inst
       (.I(ce),
        .O(ce_IBUF));
  IBUF reset_n_IBUF_inst
       (.I(reset_n),
        .O(reset_n_IBUF));
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

// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon Jun 06 19:04:06 2016
// Host        : 803-061 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/Administrator/Desktop/lab3/1001/jiance/jiance.sim/sim_1/synth/timing/jiance_tb_time_synth.v
// Design      : jiance
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module d_ff
   (y1,
    z_OBUF,
    cp_IBUF_BUFG,
    y2,
    x_IBUF,
    UNCONN_IN,
    reset_IBUF);
  output y1;
  output z_OBUF;
  input cp_IBUF_BUFG;
  input y2;
  input x_IBUF;
  input UNCONN_IN;
  input reset_IBUF;

  wire UNCONN_IN;
  wire cp_IBUF_BUFG;
  wire q_i_1__0_n_0;
  wire reset_IBUF;
  wire x_IBUF;
  wire y1;
  wire y2;
  wire z_OBUF;

  LUT2 #(
    .INIT(4'h1)) 
    q_i_1__0
       (.I0(UNCONN_IN),
        .I1(reset_IBUF),
        .O(q_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    q_i_2
       (.I0(UNCONN_IN),
        .O(UNCONN_IN));
  FDRE #(
    .INIT(1'b0)) 
    q_reg
       (.C(cp_IBUF_BUFG),
        .CE(1'b1),
        .D(q_i_1__0_n_0),
        .Q(y1),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    z_OBUF_inst_i_1
       (.I0(y1),
        .I1(y2),
        .I2(x_IBUF),
        .O(z_OBUF));
endmodule

(* ORIG_REF_NAME = "d_ff" *) 
module d_ff_0
   (y2,
    q_reg_0,
    cp_IBUF_BUFG,
    x_IBUF,
    y1,
    reset_IBUF);
  output y2;
  output q_reg_0;
  input cp_IBUF_BUFG;
  input x_IBUF;
  input y1;
  input reset_IBUF;

  wire cp_IBUF_BUFG;
  wire q_i_1_n_0;
  wire q_reg_0;
  wire reset_IBUF;
  wire x_IBUF;
  wire y1;
  wire y2;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0014)) 
    q_i_1
       (.I0(x_IBUF),
        .I1(y2),
        .I2(y1),
        .I3(reset_IBUF),
        .O(q_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    q_i_3
       (.I0(y2),
        .I1(y1),
        .I2(x_IBUF),
        .O(q_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    q_reg
       (.C(cp_IBUF_BUFG),
        .CE(1'b1),
        .D(q_i_1_n_0),
        .Q(y2),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module jiance
   (x,
    cp,
    z,
    reset);
  input x;
  input cp;
  output z;
  input reset;

  wire cp;
  wire cp_IBUF;
  wire cp_IBUF_BUFG;
  wire d_ff_2_n_1;
  wire reset;
  wire reset_IBUF;
  wire x;
  wire x_IBUF;
  wire y1;
  wire y2;
  wire z;
  wire z_OBUF;

initial begin
 $sdf_annotate("jiance_tb_time_synth.sdf",,,,"tool_control");
end
  BUFG cp_IBUF_BUFG_inst
       (.I(cp_IBUF),
        .O(cp_IBUF_BUFG));
  IBUF cp_IBUF_inst
       (.I(cp),
        .O(cp_IBUF));
  d_ff d_ff_1
       (.UNCONN_IN(d_ff_2_n_1),
        .cp_IBUF_BUFG(cp_IBUF_BUFG),
        .reset_IBUF(reset_IBUF),
        .x_IBUF(x_IBUF),
        .y1(y1),
        .y2(y2),
        .z_OBUF(z_OBUF));
  d_ff_0 d_ff_2
       (.cp_IBUF_BUFG(cp_IBUF_BUFG),
        .q_reg_0(d_ff_2_n_1),
        .reset_IBUF(reset_IBUF),
        .x_IBUF(x_IBUF),
        .y1(y1),
        .y2(y2));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
  OBUF z_OBUF_inst
       (.I(z_OBUF),
        .O(z));
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

// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon May 30 20:45:22 2016
// Host        : 803-061 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/Administrator/Desktop/lab3/lab3_3_1/lab3_3_1.sim/sim_1/synth/timing/two_2_bit_comparator_tb_time_synth.v
// Design      : two_2_bit_comparator
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module two_2_bit_comparator
   (a,
    b,
    lt,
    gt,
    eq);
  input [1:0]a;
  input [1:0]b;
  output lt;
  output gt;
  output eq;

  wire [1:0]a;
  wire [1:0]a_IBUF;
  wire [1:0]b;
  wire [1:0]b_IBUF;
  wire eq;
  wire eq_OBUF;
  wire gt;
  wire gt_OBUF;
  wire lt;
  wire lt_OBUF;

initial begin
 $sdf_annotate("two_2_bit_comparator_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \b_IBUF[0]_inst 
       (.I(b[0]),
        .O(b_IBUF[0]));
  IBUF \b_IBUF[1]_inst 
       (.I(b[1]),
        .O(b_IBUF[1]));
  OBUF eq_OBUF_inst
       (.I(eq_OBUF),
        .O(eq));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    eq_OBUF_inst_i_1
       (.I0(a_IBUF[1]),
        .I1(b_IBUF[1]),
        .I2(a_IBUF[0]),
        .I3(b_IBUF[0]),
        .O(eq_OBUF));
  OBUF gt_OBUF_inst
       (.I(gt_OBUF),
        .O(gt));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h22B2)) 
    gt_OBUF_inst_i_1
       (.I0(a_IBUF[1]),
        .I1(b_IBUF[1]),
        .I2(a_IBUF[0]),
        .I3(b_IBUF[0]),
        .O(gt_OBUF));
  OBUF lt_OBUF_inst
       (.I(lt_OBUF),
        .O(lt));
  LUT4 #(
    .INIT(16'h22B2)) 
    lt_OBUF_inst_i_1
       (.I0(b_IBUF[1]),
        .I1(a_IBUF[1]),
        .I2(b_IBUF[0]),
        .I3(a_IBUF[0]),
        .O(lt_OBUF));
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

// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "CarrierTracking0ing,Vivado 2019.2" *)
module CarrierTracking0(Ts_ap_vld, DotNumber_ap_vld, 
  DeltaThetaInitinital_ap_vld, Omega0Initinital_ap_vld, Omega1Initinital_ap_vld, ap_clk, 
  ap_rst_n, ap_start, ap_done, ap_idle, ap_ready, Ts, DotNumber, DeltaThetaInitinital, 
  Omega0Initinital, Omega1Initinital, DetaTheta_TVALID, DetaTheta_TREADY, DetaTheta_TDATA, 
  Omega0_TVALID, Omega0_TREADY, Omega0_TDATA, Omega1_TVALID, Omega1_TREADY, Omega1_TDATA);
  input Ts_ap_vld;
  input DotNumber_ap_vld;
  input DeltaThetaInitinital_ap_vld;
  input Omega0Initinital_ap_vld;
  input Omega1Initinital_ap_vld;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0]Ts;
  input [31:0]DotNumber;
  input [31:0]DeltaThetaInitinital;
  input [31:0]Omega0Initinital;
  input [31:0]Omega1Initinital;
  output DetaTheta_TVALID;
  input DetaTheta_TREADY;
  output [31:0]DetaTheta_TDATA;
  output Omega0_TVALID;
  input Omega0_TREADY;
  output [31:0]Omega0_TDATA;
  output Omega1_TVALID;
  input Omega1_TREADY;
  output [31:0]Omega1_TDATA;
endmodule

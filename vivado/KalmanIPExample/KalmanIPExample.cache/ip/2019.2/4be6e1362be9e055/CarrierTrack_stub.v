// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Mon Aug 31 22:35:04 2020
// Host        : ubuntu running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ CarrierTrack_stub.v
// Design      : CarrierTrack
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "CarrierTracking,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(Ts_ap_vld, DotNumber_ap_vld, 
  DeltaThetaInitinital_ap_vld, Omega0Initinital_ap_vld, Omega1Initinital_ap_vld, ap_clk, 
  ap_rst_n, ap_start, ap_done, ap_idle, ap_ready, Ts, DotNumber, DeltaThetaInitinital, 
  Omega0Initinital, Omega1Initinital, DetaTheta_TVALID, DetaTheta_TREADY, DetaTheta_TDATA, 
  Omega0_TVALID, Omega0_TREADY, Omega0_TDATA, Omega1_TVALID, Omega1_TREADY, Omega1_TDATA)
/* synthesis syn_black_box black_box_pad_pin="Ts_ap_vld,DotNumber_ap_vld,DeltaThetaInitinital_ap_vld,Omega0Initinital_ap_vld,Omega1Initinital_ap_vld,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,Ts[31:0],DotNumber[31:0],DeltaThetaInitinital[31:0],Omega0Initinital[31:0],Omega1Initinital[31:0],DetaTheta_TVALID,DetaTheta_TREADY,DetaTheta_TDATA[31:0],Omega0_TVALID,Omega0_TREADY,Omega0_TDATA[31:0],Omega1_TVALID,Omega1_TREADY,Omega1_TDATA[31:0]" */;
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

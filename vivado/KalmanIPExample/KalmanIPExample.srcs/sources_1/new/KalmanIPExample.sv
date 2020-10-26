`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HTGD_THZ
// Engineer: CaoHuiyang
// 
// Create Date: 08/17/2020 02:39:34 AM
// Design Name: Kalman Filter IP use exmaple
// Module Name: KalmanIPExample
// Project Name:Kalman Filter 
// Target Devices: KCU105
// Tool Versions: vivado 2019.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module KalmanIPExample(
input CLK_125MHZ_P,
input CLK_125MHZ_N,

input   ap_rst_n,
input   ap_start,
output   ap_done,
output   ap_idle,
output   ap_ready,
input   Ts_ap_vld,
input   DotNumber_ap_vld,
input   DeltaThetaInitinital_ap_vld,
input   Omega0Initinital_ap_vld,
input   Omega1Initinital_ap_vld,
output   DetaTheta_TVALID,
input   DetaTheta_TREADY,
output   Omega0_TVALID,
input   Omega0_TREADY,
output   Omega1_TVALID,
input   Omega1_TREADY);

logic   ap_clk;
logic [31:0] Ts=100;
logic [31:0] DotNumber=100;
logic [31:0] DeltaThetaInitinital=100;
logic [31:0] Omega0Initinital=100;
logic [31:0] Omega1Initinital=100;
logic  [31:0] DetaTheta_TDATA;
logic  [31:0] Omega0_TDATA;
logic  [31:0] Omega1_TDATA;

clk_wiz_0 clk_wiz_0  
 (
  // Clock out ports
  .clk_out1(ap_clk),
 // Clock in ports
  .clk_in1_p(CLK_125MHZ_P),
  .clk_in1_n(CLK_125MHZ_N)
 );
CarrierTracking0 CarrierTracking0 (.*);

endmodule

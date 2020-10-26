// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: THZ:hls:CarrierTracking:1.0
// IP Revision: 2009262341

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
CarrierTracking0 your_instance_name (
  .Ts_ap_vld(Ts_ap_vld),                                      // input wire Ts_ap_vld
  .DotNumber_ap_vld(DotNumber_ap_vld),                        // input wire DotNumber_ap_vld
  .DeltaThetaInitinital_ap_vld(DeltaThetaInitinital_ap_vld),  // input wire DeltaThetaInitinital_ap_vld
  .Omega0Initinital_ap_vld(Omega0Initinital_ap_vld),          // input wire Omega0Initinital_ap_vld
  .Omega1Initinital_ap_vld(Omega1Initinital_ap_vld),          // input wire Omega1Initinital_ap_vld
  .ap_clk(ap_clk),                                            // input wire ap_clk
  .ap_rst_n(ap_rst_n),                                        // input wire ap_rst_n
  .ap_start(ap_start),                                        // input wire ap_start
  .ap_done(ap_done),                                          // output wire ap_done
  .ap_idle(ap_idle),                                          // output wire ap_idle
  .ap_ready(ap_ready),                                        // output wire ap_ready
  .Ts(Ts),                                                    // input wire [31 : 0] Ts
  .DotNumber(DotNumber),                                      // input wire [31 : 0] DotNumber
  .DeltaThetaInitinital(DeltaThetaInitinital),                // input wire [31 : 0] DeltaThetaInitinital
  .Omega0Initinital(Omega0Initinital),                        // input wire [31 : 0] Omega0Initinital
  .Omega1Initinital(Omega1Initinital),                        // input wire [31 : 0] Omega1Initinital
  .DetaTheta_TVALID(DetaTheta_TVALID),                        // output wire DetaTheta_TVALID
  .DetaTheta_TREADY(DetaTheta_TREADY),                        // input wire DetaTheta_TREADY
  .DetaTheta_TDATA(DetaTheta_TDATA),                          // output wire [31 : 0] DetaTheta_TDATA
  .Omega0_TVALID(Omega0_TVALID),                              // output wire Omega0_TVALID
  .Omega0_TREADY(Omega0_TREADY),                              // input wire Omega0_TREADY
  .Omega0_TDATA(Omega0_TDATA),                                // output wire [31 : 0] Omega0_TDATA
  .Omega1_TVALID(Omega1_TVALID),                              // output wire Omega1_TVALID
  .Omega1_TREADY(Omega1_TREADY),                              // input wire Omega1_TREADY
  .Omega1_TDATA(Omega1_TDATA)                                // output wire [31 : 0] Omega1_TDATA
);
// INST_TAG_END ------ End INSTANTIATION Template ---------


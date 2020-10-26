-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: THZ:hls:CarrierTracking:1.0
-- IP Revision: 2009262341

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CarrierTracking0 IS
  PORT (
    Ts_ap_vld : IN STD_LOGIC;
    DotNumber_ap_vld : IN STD_LOGIC;
    DeltaThetaInitinital_ap_vld : IN STD_LOGIC;
    Omega0Initinital_ap_vld : IN STD_LOGIC;
    Omega1Initinital_ap_vld : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    Ts : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DotNumber : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DeltaThetaInitinital : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    Omega0Initinital : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    Omega1Initinital : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DetaTheta_TVALID : OUT STD_LOGIC;
    DetaTheta_TREADY : IN STD_LOGIC;
    DetaTheta_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    Omega0_TVALID : OUT STD_LOGIC;
    Omega0_TREADY : IN STD_LOGIC;
    Omega0_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    Omega1_TVALID : OUT STD_LOGIC;
    Omega1_TREADY : IN STD_LOGIC;
    Omega1_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END CarrierTracking0;

ARCHITECTURE CarrierTracking0_arch OF CarrierTracking0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF CarrierTracking0_arch: ARCHITECTURE IS "yes";
  COMPONENT CarrierTracking IS
    PORT (
      Ts_ap_vld : IN STD_LOGIC;
      DotNumber_ap_vld : IN STD_LOGIC;
      DeltaThetaInitinital_ap_vld : IN STD_LOGIC;
      Omega0Initinital_ap_vld : IN STD_LOGIC;
      Omega1Initinital_ap_vld : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      Ts : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DotNumber : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DeltaThetaInitinital : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      Omega0Initinital : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      Omega1Initinital : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DetaTheta_TVALID : OUT STD_LOGIC;
      DetaTheta_TREADY : IN STD_LOGIC;
      DetaTheta_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      Omega0_TVALID : OUT STD_LOGIC;
      Omega0_TREADY : IN STD_LOGIC;
      Omega0_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      Omega1_TVALID : OUT STD_LOGIC;
      Omega1_TREADY : IN STD_LOGIC;
      Omega1_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT CarrierTracking;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF CarrierTracking0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF Omega1_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 Omega1 TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF Omega1_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 Omega1 TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Omega1_TVALID: SIGNAL IS "XIL_INTERFACENAME Omega1, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF Omega1_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 Omega1 TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF Omega0_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 Omega0 TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF Omega0_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 Omega0 TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Omega0_TVALID: SIGNAL IS "XIL_INTERFACENAME Omega0, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF Omega0_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 Omega0 TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF DetaTheta_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 DetaTheta TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF DetaTheta_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 DetaTheta TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF DetaTheta_TVALID: SIGNAL IS "XIL_INTERFACENAME DetaTheta, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF DetaTheta_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 DetaTheta TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Omega1Initinital: SIGNAL IS "XIL_INTERFACENAME Omega1Initinital, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF Omega1Initinital: SIGNAL IS "xilinx.com:signal:data:1.0 Omega1Initinital DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Omega0Initinital: SIGNAL IS "XIL_INTERFACENAME Omega0Initinital, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF Omega0Initinital: SIGNAL IS "xilinx.com:signal:data:1.0 Omega0Initinital DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF DeltaThetaInitinital: SIGNAL IS "XIL_INTERFACENAME DeltaThetaInitinital, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF DeltaThetaInitinital: SIGNAL IS "xilinx.com:signal:data:1.0 DeltaThetaInitinital DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF DotNumber: SIGNAL IS "XIL_INTERFACENAME DotNumber, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF DotNumber: SIGNAL IS "xilinx.com:signal:data:1.0 DotNumber DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Ts: SIGNAL IS "XIL_INTERFACENAME Ts, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF Ts: SIGNAL IS "xilinx.com:signal:data:1.0 Ts DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF DetaTheta:Omega0:Omega1, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : CarrierTracking
    PORT MAP (
      Ts_ap_vld => Ts_ap_vld,
      DotNumber_ap_vld => DotNumber_ap_vld,
      DeltaThetaInitinital_ap_vld => DeltaThetaInitinital_ap_vld,
      Omega0Initinital_ap_vld => Omega0Initinital_ap_vld,
      Omega1Initinital_ap_vld => Omega1Initinital_ap_vld,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      Ts => Ts,
      DotNumber => DotNumber,
      DeltaThetaInitinital => DeltaThetaInitinital,
      Omega0Initinital => Omega0Initinital,
      Omega1Initinital => Omega1Initinital,
      DetaTheta_TVALID => DetaTheta_TVALID,
      DetaTheta_TREADY => DetaTheta_TREADY,
      DetaTheta_TDATA => DetaTheta_TDATA,
      Omega0_TVALID => Omega0_TVALID,
      Omega0_TREADY => Omega0_TREADY,
      Omega0_TDATA => Omega0_TDATA,
      Omega1_TVALID => Omega1_TVALID,
      Omega1_TREADY => Omega1_TREADY,
      Omega1_TDATA => Omega1_TDATA
    );
END CarrierTracking0_arch;

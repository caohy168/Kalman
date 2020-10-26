-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Mon Aug 31 22:35:04 2020
-- Host        : ubuntu running 64-bit Ubuntu 18.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ CarrierTrack_stub.vhdl
-- Design      : CarrierTrack
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    Ts_ap_vld : in STD_LOGIC;
    DotNumber_ap_vld : in STD_LOGIC;
    DeltaThetaInitinital_ap_vld : in STD_LOGIC;
    Omega0Initinital_ap_vld : in STD_LOGIC;
    Omega1Initinital_ap_vld : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    Ts : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DotNumber : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DeltaThetaInitinital : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Omega0Initinital : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Omega1Initinital : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DetaTheta_TVALID : out STD_LOGIC;
    DetaTheta_TREADY : in STD_LOGIC;
    DetaTheta_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Omega0_TVALID : out STD_LOGIC;
    Omega0_TREADY : in STD_LOGIC;
    Omega0_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Omega1_TVALID : out STD_LOGIC;
    Omega1_TREADY : in STD_LOGIC;
    Omega1_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Ts_ap_vld,DotNumber_ap_vld,DeltaThetaInitinital_ap_vld,Omega0Initinital_ap_vld,Omega1Initinital_ap_vld,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,Ts[31:0],DotNumber[31:0],DeltaThetaInitinital[31:0],Omega0Initinital[31:0],Omega1Initinital[31:0],DetaTheta_TVALID,DetaTheta_TREADY,DetaTheta_TDATA[31:0],Omega0_TVALID,Omega0_TREADY,Omega0_TDATA[31:0],Omega1_TVALID,Omega1_TREADY,Omega1_TDATA[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "CarrierTracking,Vivado 2019.2";
begin
end;

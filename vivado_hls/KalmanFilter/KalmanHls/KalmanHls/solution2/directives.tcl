############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode ap_vld "CarrierTracking" DotNumber
set_directive_interface -mode ap_vld "CarrierTracking" DeltaThetaInitinital
set_directive_interface -mode ap_vld "CarrierTracking" Omega0Initinital
set_directive_interface -mode ap_vld "CarrierTracking" Ts
set_directive_interface -mode ap_vld "CarrierTracking" Omega1Initinital
set_directive_interface -mode axis -register -register_mode both "CarrierTracking" Omega0
set_directive_interface -mode axis -register -register_mode both "CarrierTracking" Omega1
set_directive_interface -mode axis -register -register_mode both "CarrierTracking" DetaTheta
set_directive_loop_flatten "CarrierTracking/Kalman_recursion_Loop"

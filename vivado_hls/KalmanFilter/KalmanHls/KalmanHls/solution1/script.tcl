############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project KalmanHls
set_top CarrierTracking
add_files ../Kalman.h
add_files ../Kalman.cpp
add_files -tb ../Kalman_inspire.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xcvu9p-flga2104-2L-e}
create_clock -period 10 -name default
#source "./KalmanHls/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -tool xsim
export_design -rtl verilog -format ip_catalog

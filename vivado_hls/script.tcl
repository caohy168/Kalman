############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project KalmanHls
set_top CarrierTracking
add_files ../Kalman.cpp
add_files ../Kalman.h
add_files -tb ../Kalman_inspire.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution2"
set_part {xcku040-ffva1156-2-e}
create_clock -period 10 -name default
config_array_partition -auto_partition_threshold 4 -auto_promotion_threshold 64 -include_extern_globals=0 -include_ports=0 -maximum_size 20480 -scalarize_all=0 -throughput_driven
config_rtl -encoding auto -kernel_profile=0 -module_auto_prefix=0 -mult_keep_attribute=0 -reset control -reset_async=0 -reset_level high -verbose=0
config_export -description {Kalman Filter} -display_name Kalman -format ip_catalog -library hls -rtl verilog -vendor THZ -version 1.0 -vivado_optimization_level 2 -vivado_phys_opt place -vivado_report_level 0
source "./KalmanHls/solution2/directives.tcl"
csim_design -clean
csynth_design
cosim_design -wave_debug -trace_level all -tool xsim
export_design -flow impl -rtl verilog -format ip_catalog -description "Kalman Filter" -vendor "THZ" -display_name "Kalman"

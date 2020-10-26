vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/axi_utils_v2_0_6
vlib questa_lib/msim/xbip_pipe_v3_0_6
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vlib questa_lib/msim/xbip_bram18k_v3_0_6
vlib questa_lib/msim/mult_gen_v12_0_16
vlib questa_lib/msim/floating_point_v7_1_9
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 questa_lib/msim/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 questa_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 questa_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 questa_lib/msim/mult_gen_v12_0_16
vmap floating_point_v7_1_9 questa_lib/msim/floating_point_v7_1_9
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -sv \
"/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -64 -93 \
"../../../ipstatic/xbip_utils_v3_0_10/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -64 -93 \
"../../../ipstatic/axi_utils_v2_0_6/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"../../../ipstatic/xbip_pipe_v3_0_6/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../ipstatic/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -64 -93 \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_6/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -64 -93 \
"../../../ipstatic/xbip_dsp48_multadd_v3_0_6/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -64 -93 \
"../../../ipstatic/xbip_bram18k_v3_0_6/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -64 -93 \
"../../../ipstatic/mult_gen_v12_0_16/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_9 -64 -93 \
"../../../ipstatic/floating_point_v7_1_9/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work xil_defaultlib -64 \
"../../../ipstatic/hdl/verilog/CarrierTracking_dbkb.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_dkbM.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_dlbW.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_fdEe.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_feOg.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_ffYi.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_fg8j.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_fibs.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_fjbC.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_scud.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_shbi.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_V.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking_W.v" \
"../../../ipstatic/hdl/verilog/NoiseRand.v" \
"../../../ipstatic/hdl/verilog/pow_generic_double_s.v" \
"../../../ipstatic/hdl/verilog/regslice_core.v" \
"../../../ipstatic/hdl/verilog/CarrierTracking.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_fdiv_6_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_fadd_2_full_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_fptrunc_0_no_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_dmul_3_max_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_faddfsub_2_full_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_dsqrt_19_no_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_sitodp_2_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_ddiv_15_no_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_fpext_0_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_fmul_0_max_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/CarrierTracking_ap_sitofp_1_no_dsp_32.vhd" \
"../../../../KalmanIPExample.srcs/sources_1/ip/CarrierTracking0/sim/CarrierTracking0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"


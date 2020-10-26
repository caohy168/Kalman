create_project prj -part xcvu9p-flga2104-2L-e -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_ddiv_8_no_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_ddiv_8_no_dsp_64]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_fdiv_4_no_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_fdiv_4_no_dsp_32]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_sitodp_0_no_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_sitodp_0_no_dsp_32]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_fptrunc_0_no_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_fptrunc_0_no_dsp_64]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_fadd_0_full_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_fadd_0_full_dsp_32]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_fmul_0_max_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_fmul_0_max_dsp_32]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_dmul_1_max_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_dmul_1_max_dsp_64]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_fpext_0_no_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_fpext_0_no_dsp_32]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_sitofp_0_no_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_sitofp_0_no_dsp_32]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_faddfsub_0_full_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_faddfsub_0_full_dsp_32]]
}
source "/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/syn/verilog/CarrierTracking_ap_dsqrt_7_no_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips CarrierTracking_ap_dsqrt_7_no_dsp_64]]
}

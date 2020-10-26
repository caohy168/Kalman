// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pow_generic_double_s (
        ap_ready,
        exp,
        ap_return
);


output   ap_ready;
input  [63:0] exp;
output  [63:0] ap_return;

wire   [63:0] p_Val2_s_fu_70_p1;
wire   [10:0] tmp_V_fu_74_p4;
wire   [11:0] zext_ln502_fu_88_p1;
wire   [51:0] tmp_V_1_fu_84_p1;
wire   [0:0] icmp_ln833_1_fu_104_p2;
wire   [0:0] icmp_ln833_2_fu_110_p2;
wire   [0:0] icmp_ln837_fu_122_p2;
wire   [11:0] m_exp_fu_92_p2;
wire   [0:0] tmp_fu_140_p3;
wire   [5:0] tmp_1_fu_154_p4;
wire   [5:0] add_ln601_fu_164_p2;
wire   [51:0] zext_ln601_fu_170_p1;
wire   [51:0] lshr_ln601_fu_174_p2;
wire   [51:0] p_Result_s_fu_180_p2;
wire   [0:0] icmp_ln401_fu_134_p2;
wire   [0:0] icmp_ln833_3_fu_186_p2;
wire   [0:0] xor_ln401_fu_192_p2;
wire   [0:0] and_ln402_fu_198_p2;
wire   [0:0] xor_ln402_fu_148_p2;
wire   [0:0] and_ln402_1_fu_204_p2;
wire   [0:0] icmp_ln833_fu_98_p2;
wire   [0:0] and_ln18_fu_116_p2;
wire   [0:0] or_ln401_fu_210_p2;
wire   [0:0] and_ln18_1_fu_128_p2;
wire   [0:0] xor_ln415_fu_222_p2;
wire   [0:0] or_ln415_fu_228_p2;
wire   [31:0] or_ln415_1_fu_234_p3;
wire   [11:0] bvh_d_index_fu_266_p2;
wire  signed [31:0] sext_ln451_fu_272_p1;
wire   [0:0] icmp_ln450_fu_248_p2;
wire   [0:0] icmp_ln451_fu_254_p2;
wire   [0:0] icmp_ln451_1_fu_260_p2;
wire   [0:0] p_Result_4_fu_276_p3;
wire   [0:0] xor_ln450_fu_284_p2;
wire   [0:0] and_ln451_1_fu_296_p2;
wire   [0:0] and_ln451_fu_290_p2;
wire   [0:0] and_ln451_2_fu_302_p2;
wire   [0:0] r_sign_fu_308_p2;
wire   [63:0] p_Result_5_fu_314_p3;
wire   [0:0] or_ln407_fu_216_p2;
wire   [0:0] icmp_ln415_fu_242_p2;
wire   [0:0] xor_ln407_fu_326_p2;
wire   [0:0] and_ln415_fu_332_p2;
wire   [63:0] bitcast_ln512_fu_322_p1;
wire   [63:0] select_ln415_fu_338_p3;

assign add_ln601_fu_164_p2 = (6'd1 + tmp_1_fu_154_p4);

assign and_ln18_1_fu_128_p2 = (icmp_ln837_fu_122_p2 & icmp_ln833_1_fu_104_p2);

assign and_ln18_fu_116_p2 = (icmp_ln833_2_fu_110_p2 & icmp_ln833_1_fu_104_p2);

assign and_ln402_1_fu_204_p2 = (xor_ln402_fu_148_p2 & and_ln402_fu_198_p2);

assign and_ln402_fu_198_p2 = (xor_ln401_fu_192_p2 & icmp_ln833_3_fu_186_p2);

assign and_ln415_fu_332_p2 = (xor_ln407_fu_326_p2 & icmp_ln415_fu_242_p2);

assign and_ln451_1_fu_296_p2 = (xor_ln450_fu_284_p2 & p_Result_4_fu_276_p3);

assign and_ln451_2_fu_302_p2 = (and_ln451_fu_290_p2 & and_ln451_1_fu_296_p2);

assign and_ln451_fu_290_p2 = (icmp_ln451_fu_254_p2 & icmp_ln451_1_fu_260_p2);

assign ap_ready = 1'b1;

assign ap_return = ((or_ln407_fu_216_p2[0:0] === 1'b1) ? 64'd4607182418800017408 : select_ln415_fu_338_p3);

assign bitcast_ln512_fu_322_p1 = p_Result_5_fu_314_p3;

assign bvh_d_index_fu_266_p2 = (12'd1075 - zext_ln502_fu_88_p1);

assign icmp_ln401_fu_134_p2 = (($signed(m_exp_fu_92_p2) > $signed(12'd51)) ? 1'b1 : 1'b0);

assign icmp_ln415_fu_242_p2 = ((or_ln415_1_fu_234_p3 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln450_fu_248_p2 = ((m_exp_fu_92_p2 == 12'd0) ? 1'b1 : 1'b0);

assign icmp_ln451_1_fu_260_p2 = (($signed(m_exp_fu_92_p2) < $signed(12'd53)) ? 1'b1 : 1'b0);

assign icmp_ln451_fu_254_p2 = (($signed(m_exp_fu_92_p2) > $signed(12'd0)) ? 1'b1 : 1'b0);

assign icmp_ln833_1_fu_104_p2 = ((tmp_V_fu_74_p4 == 11'd2047) ? 1'b1 : 1'b0);

assign icmp_ln833_2_fu_110_p2 = ((tmp_V_1_fu_84_p1 == 52'd0) ? 1'b1 : 1'b0);

assign icmp_ln833_3_fu_186_p2 = ((p_Result_s_fu_180_p2 == 52'd0) ? 1'b1 : 1'b0);

assign icmp_ln833_fu_98_p2 = ((tmp_V_fu_74_p4 == 11'd0) ? 1'b1 : 1'b0);

assign icmp_ln837_fu_122_p2 = ((tmp_V_1_fu_84_p1 != 52'd0) ? 1'b1 : 1'b0);

assign lshr_ln601_fu_174_p2 = 52'd4503599627370495 >> zext_ln601_fu_170_p1;

assign m_exp_fu_92_p2 = ($signed(12'd3073) + $signed(zext_ln502_fu_88_p1));

assign or_ln401_fu_210_p2 = (icmp_ln401_fu_134_p2 | and_ln402_1_fu_204_p2);

assign or_ln407_fu_216_p2 = (icmp_ln833_fu_98_p2 | and_ln18_fu_116_p2);

assign or_ln415_1_fu_234_p3 = {{31'd0}, {or_ln415_fu_228_p2}};

assign or_ln415_fu_228_p2 = (xor_ln415_fu_222_p2 | and_ln18_1_fu_128_p2);

assign p_Result_4_fu_276_p3 = tmp_V_1_fu_84_p1[sext_ln451_fu_272_p1];

assign p_Result_5_fu_314_p3 = {{r_sign_fu_308_p2}, {63'd4607182418800017408}};

assign p_Result_s_fu_180_p2 = (tmp_V_1_fu_84_p1 & lshr_ln601_fu_174_p2);

assign p_Val2_s_fu_70_p1 = exp;

assign r_sign_fu_308_p2 = (icmp_ln450_fu_248_p2 | and_ln451_2_fu_302_p2);

assign select_ln415_fu_338_p3 = ((and_ln415_fu_332_p2[0:0] === 1'b1) ? bitcast_ln512_fu_322_p1 : 64'd9223372036854775807);

assign sext_ln451_fu_272_p1 = $signed(bvh_d_index_fu_266_p2);

assign tmp_1_fu_154_p4 = {{p_Val2_s_fu_70_p1[57:52]}};

assign tmp_V_1_fu_84_p1 = p_Val2_s_fu_70_p1[51:0];

assign tmp_V_fu_74_p4 = {{p_Val2_s_fu_70_p1[62:52]}};

assign tmp_fu_140_p3 = m_exp_fu_92_p2[32'd11];

assign xor_ln401_fu_192_p2 = (icmp_ln401_fu_134_p2 ^ 1'd1);

assign xor_ln402_fu_148_p2 = (tmp_fu_140_p3 ^ 1'd1);

assign xor_ln407_fu_326_p2 = (or_ln407_fu_216_p2 ^ 1'd1);

assign xor_ln415_fu_222_p2 = (or_ln401_fu_210_p2 ^ 1'd1);

assign xor_ln450_fu_284_p2 = (icmp_ln450_fu_248_p2 ^ 1'd1);

assign zext_ln502_fu_88_p1 = tmp_V_fu_74_p4;

assign zext_ln601_fu_170_p1 = add_ln601_fu_164_p2;

endmodule //pow_generic_double_s

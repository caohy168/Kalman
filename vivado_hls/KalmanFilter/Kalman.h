// Title:Kalman filter for CarrierTracking.
// Author:CaoHuiyang at HTGD-THZ Research and Department.
// Created at July 28 2020,Kalman filter for carrier tracking vivado_hls program framework was created.
// Reference "Kalman_carruer_tracking.m"by CaoHuiyang,HTGD-THZ and "KalmanFilter" by Lauszus, TKJ Electronics "
// Web:https://www.htgd.com.cn/  //e-mail:caohy@htgd.com.cn  //QQ:2685997598

#ifndef _Kalman_h_
#define _Kalman_h_

typedef float kalman_variable;
typedef float Noise_variable;

int KalmanRand(void);
void Noise (Noise_variable Ts,
		    Noise_variable detav,Noise_variable detaw,
		    Noise_variable Q[3][3],Noise_variable R,
		    Noise_variable V[20000],Noise_variable W[3][20000]);

void CarrierTracking(kalman_variable Ts,
					 int DotNumber,
					 kalman_variable DeltaThetaInitinital,kalman_variable Omega0Initinital,kalman_variable Omega1Initinital,
					 kalman_variable DetaTheta[10000],kalman_variable Omega0[10000],kalman_variable Omega1[10000]);

#endif

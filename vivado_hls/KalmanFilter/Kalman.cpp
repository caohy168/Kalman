// Title:Kalman filter for CarrierTracking.
// Author:CaoHuiyang at HTGD-THZ Research and Department.
// Web:https://www.htgd.com.cn/  //e-mail:caohy@htgd.com.cn  //QQ:2685997598
// Created at July 28 2020,Kalman filter for carrier tracking vivado_hls program framework was created.
// Change at August 03 2020,change array dimensionality and depth,add for loop to real to Kalman formula.
// change at August 12 2020,modify the parameters and functions and detect the result the have conform to the matlab simulate result.
// change at August 16 2020,add the DetaTheta,Omega0,Omega1 as input and remove the parameter change from Kalman_recursion_Loop.
// Reference "Kalman_carruer_tracking.m"by CaoHuiyang,HTGD-THZ and "KalmanFilter" by Lauszus, TKJ Electronics "

#include "Kalman.h"
#include<stdio.h>
#include<math.h>
//#include"ap_fixed.h"

int next = 1;
int NoiseRand(void)
{
    next = (next * 13515245 + 12345)*pow(-1,next);
    return (int)(next / 65536) % 32768;
}

void Noise (Noise_variable Ts,
		Noise_variable detav,Noise_variable detaw,
		Noise_variable Q[3][3],Noise_variable R,
		Noise_variable V[20000],Noise_variable W[3][20000]){
	//V=sqrt(R)*randn(1,N);		    %Measure Noise
	//W=sqrt(Q)*randn(3,N);		    %Process Noise
	for( int j = 0; j <20000 ; j = j + 1 ){
		V[j]=sqrt(R)*NoiseRand()*1e-4;
		float r0=NoiseRand();
		float r1=NoiseRand();
		float r2=NoiseRand();
		W[0][j]=(Q[0][0]*r0+Q[0][1]*r1+Q[0][2]*r2)*1e6;
		W[1][j]=(Q[0][0]*r0+Q[0][1]*r1+Q[0][2]*r2)*1e6;
		W[2][j]=(Q[0][0]*r0+Q[0][1]*r1+Q[0][2]*r2)*1e6;
	};
};
void CarrierTracking(kalman_variable Ts,
					 int DotNumber,
					 kalman_variable DeltaThetaInitinital,kalman_variable Omega0Initinital,kalman_variable Omega1Initinital,
					 kalman_variable DetaTheta[10000],kalman_variable Omega0[10000],kalman_variable Omega1[10000]) {


kalman_variable X[3][20000];    // System State Matrix
kalman_variable X_pre[3][20000];// State Prediction
kalman_variable Xkf[3][20000];  // State Update
kalman_variable Z[20000];       // Measure Value Matrix
kalman_variable P0[3][20000];   // Error covariance Matrix
kalman_variable P1[3][20000];   // Error covariance Matrix
kalman_variable P2[3][20000];   // Error covariance Matrix
kalman_variable P_pre0[3][20000];// Error covariance Matrix calculate intermediate variable
kalman_variable P_pre1[3][20000];// Error covariance Matrix calculate intermediate variable
kalman_variable P_pre2[3][20000];// Error covariance Matrix calculate intermediate variable
kalman_variable A[3][3]; 		  // Transfer Matrix
kalman_variable H[3];	   		  // Observe Matrix
kalman_variable B[3];	   		  // System Parameter
kalman_variable V[20000];	      //Measure Noise
kalman_variable W[3][20000];	  //Process Noise

kalman_variable kgd;			  // Kg denominator
kalman_variable kgn[3];         // Kg numerator
kalman_variable Kg[3];		  // Kalman gain

//A=[1,Ts,Ts^2/2;0,1,Ts;0,0,1];					%Transfer Matrix
    A[0][0] = 1.0;
	A[0][1] = Ts;
	A[0][2] = Ts*Ts/2;
	A[1][0] = 0;
	A[1][1] = 1.0;
	A[1][2] = Ts;
	A[2][0] = 0;
	A[2][1] = 0;
	A[2][2] = 1.0;
//H=[1,Ts/2,Ts^2/6];							%Observe Matrix
	H[0]	= 1;
	H[1]	= Ts/2;
	H[2]	= Ts*Ts/6;
//X Matrix--System State
	X[0][0]=DeltaThetaInitinital;
	X[1][0]=Omega0Initinital;
	X[2][0]=Omega1Initinital;
//Xkf=zeros(3,N);State Update initialize
	for( int i = 0; i <3 ; i = i + 1 )Xkf[i][0]=0;
	Xkf[0][0]=X[0][0];
	Xkf[1][0]=X[1][0];
	Xkf[2][0]=X[2][0];
//%Calculate the initial observations
	Z[0]=H[0]*X[0][0]+H[1]*X[1][0]+H[2]*X[2][0];
//	P0=[1/12,0,0;
//		0,1*10^(-4),0;
//		0,0,1*10^(-4)];				%System State Convariance Initial
	P0[0][0]=0.0833333333333333;
	P0[1][0]=0;
	P0[2][0]=0;
	P1[0][0]=0;
	P1[1][0]=1e-4;
	P1[2][0]=0;
	P2[0][0]=0;
	P2[1][0]=0;
	P2[2][0]=1e-4;
//Generate Noise
	kalman_variable detav=1e-3;					//detav
	kalman_variable detaw=1e-3;					//detaw
//Q=	detav^2* [Ts^6/252,Ts^5/72,Ts^4/30;
//		Ts^5/72 ,Ts^4/20,Ts^3/8;
//		Ts^4/30 ,Ts^3/8 ,Ts^2/3];//Noise Convariance Q
	kalman_variable Q[3][3];
	kalman_variable R;
    Q[0][0] = pow(detav,2)*pow(Ts,6)/252;
	Q[0][1] = pow(detav,2)*pow(Ts,5)/72;
	Q[0][2] = pow(detav,2)*pow(Ts,4)/30;
	Q[1][0] = pow(detav,2)*pow(Ts,5)/72;
	Q[1][1] = pow(detav,2)*pow(Ts,4)/20;
	Q[1][2] = pow(detav,2)*pow(Ts,3)/8;
	Q[2][0] = pow(detav,2)*pow(Ts,4)/30;
	Q[2][1] = pow(detav,2)*pow(Ts,3)/8;
	Q[2][2] = pow(detav,2)*pow(Ts,2)/3;
//R=detaw^2/Ts^4;			     //Noise Convariance R
	R=pow(detaw,2)/pow(Ts,4);
	Noise(Ts,detav,detaw,Q,R,V,W);

int k;
Kalman_recursion_Loop: for( k = 1; k <DotNumber ; k = k + 1 ){
/*	if (k==3000){
		X[2][k-1]=80e3;	    //System State change Value
		Xkf[2][k-1]=X[2][k-1];}
	else if (k==3500){
		X[2][k-1]=0;			    //System State change Value
		Xkf[2][k-1]=X[2][k-1];}
	else if (k==9000){
		X[2][k-1]=-80e3;	    //System State change Value
		Xkf[2][k-1]=X[2][k-1];}
	else if (k==9500){
		X[2][k-1]=0;				//System State change Value
		Xkf[2][k-1]=X[2][k-1];}
	else if (k==15500){
		X[2][k-1]=80e3;		//System State change Value
		Xkf[2][k-1]=X[2][k-1];}
	else if (k==16000){
		X[2][k-1]=0;		        //System State change Value
		Xkf[2][k-1]=X[2][k-1];}*/
// Step 1:X(:,k)=A*X(:,k-1)+W(k-1);State Equation//
	X[0][k]=A[0][0]*X[0][k-1]+A[0][1]*X[1][k-1]+A[0][2]*X[2][k-1]+W[0][k-1];//
	X[1][k]=A[1][0]*X[0][k-1]+A[1][1]*X[1][k-1]+A[1][2]*X[2][k-1]+W[1][k-1];//
	X[2][k]=A[2][0]*X[0][k-1]+A[2][1]*X[1][k-1]+A[2][2]*X[2][k-1]+W[2][k-1];//

// Step 2:Z(k)=H*X(:,k)+V(k);Observe Equation//
	Z[k]=H[0]*X[0][k]+H[1]*X[1][k]+H[2]*X[2][k]+V[k];//

// Step 3:X_pre(:,k)=A*Xkf(:,k-1);State Predicte Equation//
    X_pre[0][k]=A[0][0]*Xkf[0][k-1]+A[0][1]*Xkf[1][k-1]+A[0][2]*Xkf[2][k-1];//
    X_pre[1][k]=A[1][0]*Xkf[0][k-1]+A[1][1]*Xkf[1][k-1]+A[1][2]*Xkf[2][k-1];//
    X_pre[2][k]=A[2][0]*Xkf[0][k-1]+A[2][1]*Xkf[1][k-1]+A[2][2]*Xkf[2][k-1];//
// Step 4:P_pre(:,:,k)=A*P(:,:,k-1)*A'+Q;Convariance Predicte Equation//
	P_pre0[0][k]=	(A[0][0]*P0[0][k-1]+A[0][1]*P1[0][k-1]+A[0][2]*P2[0][k-1])*A[0][0]+(A[0][0]*P0[1][k-1]+A[0][1]*P1[1][k-1]+A[0][2]*P2[1][k-1])*A[0][1]+(A[0][0]*P0[2][k-1]+A[0][1]*P1[2][k-1]+A[0][2]*P2[2][k-1])*A[0][2]+Q[0][0];
	P_pre0[1][k]=	(A[0][0]*P0[0][k-1]+A[0][1]*P1[0][k-1]+A[0][2]*P2[0][k-1])*A[1][0]+(A[0][0]*P0[1][k-1]+A[0][1]*P1[1][k-1]+A[0][2]*P2[1][k-1])*A[1][1]+(A[0][0]*P0[2][k-1]+A[0][1]*P1[2][k-1]+A[0][2]*P2[2][k-1])*A[1][2]+Q[0][1];
	P_pre0[2][k]=	(A[0][0]*P0[0][k-1]+A[0][1]*P1[0][k-1]+A[0][2]*P2[0][k-1])*A[2][0]+(A[0][0]*P0[1][k-1]+A[0][1]*P1[1][k-1]+A[0][2]*P2[1][k-1])*A[2][1]+(A[0][0]*P0[2][k-1]+A[0][1]*P1[2][k-1]+A[0][2]*P2[2][k-1])*A[2][2]+Q[0][2];
//
	P_pre1[0][k]=	(A[1][0]*P0[0][k-1]+A[1][1]*P1[0][k-1]+A[1][2]*P2[0][k-1])*A[0][0]+(A[1][0]*P0[1][k-1]+A[1][1]*P1[1][k-1]+A[1][2]*P2[1][k-1])*A[0][1]+(A[1][0]*P0[2][k-1]+A[1][1]*P1[2][k-1]+A[1][2]*P2[2][k-1])*A[0][2]+Q[1][0];
	P_pre1[1][k]=	(A[1][0]*P0[0][k-1]+A[1][1]*P1[0][k-1]+A[1][2]*P2[0][k-1])*A[1][0]+(A[1][0]*P0[1][k-1]+A[1][1]*P1[1][k-1]+A[1][2]*P2[1][k-1])*A[1][1]+(A[1][0]*P0[2][k-1]+A[1][1]*P1[2][k-1]+A[1][2]*P2[2][k-1])*A[1][2]+Q[1][1];
	P_pre1[2][k]=	(A[1][0]*P0[0][k-1]+A[1][1]*P1[0][k-1]+A[1][2]*P2[0][k-1])*A[2][0]+(A[1][0]*P0[1][k-1]+A[1][1]*P1[1][k-1]+A[1][2]*P2[1][k-1])*A[2][1]+(A[1][0]*P0[2][k-1]+A[1][1]*P1[2][k-1]+A[1][2]*P2[2][k-1])*A[2][2]+Q[1][2];
//
	P_pre2[0][k]=	(A[2][0]*P0[0][k-1]+A[2][1]*P1[0][k-1]+A[2][2]*P2[0][k-1])*A[0][0]+(A[2][0]*P0[1][k-1]+A[2][1]*P1[1][k-1]+A[2][2]*P2[1][k-1])*A[0][1]+(A[2][0]*P0[2][k-1]+A[2][1]*P1[2][k-1]+A[2][2]*P2[2][k-1])*A[0][2]+Q[2][0];
	P_pre2[1][k]=	(A[2][0]*P0[0][k-1]+A[2][1]*P1[0][k-1]+A[2][2]*P2[0][k-1])*A[1][0]+(A[2][0]*P0[1][k-1]+A[2][1]*P1[1][k-1]+A[2][2]*P2[1][k-1])*A[1][1]+(A[2][0]*P0[2][k-1]+A[2][1]*P1[2][k-1]+A[2][2]*P2[2][k-1])*A[1][2]+Q[2][1];
	P_pre2[2][k]=	(A[2][0]*P0[0][k-1]+A[2][1]*P1[0][k-1]+A[2][2]*P2[0][k-1])*A[2][0]+(A[2][0]*P0[1][k-1]+A[2][1]*P1[1][k-1]+A[2][2]*P2[1][k-1])*A[2][1]+(A[2][0]*P0[2][k-1]+A[2][1]*P1[2][k-1]+A[2][2]*P2[2][k-1])*A[2][2]+Q[2][2];
//
	 // Step 5:Kg=P_pre(:,:,k)*H'*inv(H*P_pre(:,:,k)*H'+R);
	 // Kalman Gain Equation
	 // Denominator kgd=(H*P_pre(:,:,k)*H'+R)
	 kgd=(P_pre0[0][k]*H[0]*H[0]+P_pre1[0][k]*H[0]*H[1]+P_pre2[0][k]*H[0]*H[2]+P_pre0[1][k]*H[0]*H[1]+P_pre1[1][k]*H[1]*H[1]+P_pre2[1][k]*H[1]*H[2]+P_pre0[2][k]*H[0]*H[2]+P_pre1[2][k]*H[1]*H[2]+P_pre2[2][k]*H[2]*H[2])+R;
	 // Numerator
	 kgn[0]=P_pre0[0][k]*H[0]+P_pre0[1][k]*H[1]+P_pre0[2][k]*H[2];
	 kgn[1]=P_pre1[0][k]*H[0]+P_pre1[1][k]*H[1]+P_pre1[2][k]*H[2];
	 kgn[2]=P_pre2[0][k]*H[0]+P_pre2[1][k]*H[1]+P_pre2[2][k]*H[2];

	 Kg[0]=kgn[0]/kgd;
	 Kg[1]=kgn[1]/kgd;
	 Kg[2]=kgn[2]/kgd;

	// Step 6:Xkf(:,k)=X_pre(:,k)+Kg*(Z(k)-H*X_pre(:,k));;State Update Equation.
	 Xkf[0][k]=X_pre[0][k]+Kg[0]*(Z[k]-H[0]*X_pre[0][k]+H[1]*X_pre[1][k]+H[2]*X_pre[2][k]);
	 Xkf[1][k]=X_pre[1][k]+Kg[1]*(Z[k]-H[0]*X_pre[0][k]+H[1]*X_pre[1][k]+H[2]*X_pre[2][k]);
	 Xkf[2][k]=X_pre[2][k]+Kg[2]*(Z[k]-H[0]*X_pre[0][k]+H[1]*X_pre[1][k]+H[2]*X_pre[2][k]);
    // Step 7:P(:,:,k)=(I-Kg*H)*P_pre(:,:,k);Convariance Update Equation
	 P0[0][k]=(-1)*((Kg[0]*H[0]-1)*P_pre0[0][k]+Kg[0]*H[1]*P_pre1[0][k]+Kg[0]*H[2]*P_pre2[0][k]);
     P0[1][k]=(-1)*((Kg[0]*H[0]-1)*P_pre0[1][k]+Kg[0]*H[1]*P_pre1[1][k]+Kg[0]*H[2]*P_pre2[1][k]);
	 P0[2][k]=(-1)*((Kg[0]*H[0]-1)*P_pre0[2][k]+Kg[0]*H[1]*P_pre1[2][k]+Kg[0]*H[2]*P_pre2[2][k]);

     P1[0][k]=(-1)*(Kg[1]*H[0]*P_pre0[0][k]+(Kg[1]*H[1]-1)*P_pre1[0][k]+Kg[1]*H[2]*P_pre2[0][k]);
     P1[1][k]=(-1)*(Kg[1]*H[0]*P_pre0[1][k]+(Kg[1]*H[1]-1)*P_pre1[1][k]+Kg[1]*H[2]*P_pre2[1][k]);
	 P1[2][k]=(-1)*(Kg[1]*H[0]*P_pre0[2][k]+(Kg[1]*H[1]-1)*P_pre1[2][k]+Kg[1]*H[2]*P_pre2[2][k]);

     P2[0][k]=(-1)*(Kg[2]*H[0]*P_pre0[0][k]+Kg[2]*H[1]*P_pre1[0][k]+(Kg[2]*H[2]-1)*P_pre2[0][k]);
     P2[1][k]=(-1)*(Kg[2]*H[0]*P_pre0[1][k]+Kg[2]*H[1]*P_pre1[1][k]+(Kg[2]*H[2]-1)*P_pre2[1][k]);
     P2[2][k]=(-1)*(Kg[2]*H[0]*P_pre0[2][k]+Kg[2]*H[1]*P_pre1[2][k]+(Kg[2]*H[2]-1)*P_pre2[2][k]);

     DetaTheta[k] = X_pre[0][k];
     Omega0[k] = X_pre[1][k];
	 Omega1[k] = X_pre[2][k];
     };

};


#include "Kalman.h"
#include <stdio.h>
#include <math.h>
#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

int main()
{
	int Money=10000;
	FILE * f;
	ofstream result;

	cout << left;
	cout << setfill('*');

	string Title;
	kalman_variable Ts=1e-3;//Sample period
	int DotNumber;
	kalman_variable DetaTheta[10000];
	kalman_variable Omega0[10000];
	kalman_variable Omega1[10000];
	kalman_variable DeltaThetaInitinital;
	kalman_variable Omega0Initinital;
	kalman_variable Omega1Initinital;

	if(Money<10000){
		while(Money<10000){
			cout << "You can wait me: " << Money << endl;
			Money++;
			cout << "Sorry,we are lost 1ps. " << endl;
		}
		cout << "have to do the math by yourself,no result will be printed! " <<endl;
	}
	else{
		cout << "That's very generous!  Let's get to working right away,wait me a little time! " <<endl;
		cout << "Can give you a set of calculations that correspond to the amount of money. " <<endl;

		switch(Money){
			case 10000:
			//Dot 0~3000
				DotNumber=3000;
				DeltaThetaInitinital=0;
				Omega0Initinital=-20e3;
				Omega1Initinital=0;
				CarrierTracking(Ts,DotNumber,
								DeltaThetaInitinital,Omega0Initinital,Omega1Initinital,
								DetaTheta,Omega0,Omega1);
				Title = "DetaTheta dot 1-3000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << DetaTheta[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega0 dot 1-3000 display as below:";
				cout << Title  <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega0[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega1 dot 1-3000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega1[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;

				f = fopen("/home/caohy/work/Kalman/vivado_hls/KalmanFilter/output.dat", "w");
				fprintf(f, "%d ", (int)DeltaThetaInitinital);
				for(int k=1; k<DotNumber; k++)
					fprintf(f, "%d ", (int)round(DetaTheta[k]));
			    fclose(f);

				break;
			case 20000:
			//Dot 3000~3500
				DotNumber=500;
				DeltaThetaInitinital=-60e3;
				Omega0Initinital=-20e3;
				Omega1Initinital=80e3;
				CarrierTracking(Ts,DotNumber,
								DeltaThetaInitinital,Omega0Initinital,Omega1Initinital,
								DetaTheta,Omega0,Omega1);
				Title = "DetaTheta dot 3001-3500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << DetaTheta[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega0 dot 3001-3500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega0[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega1 dot 3001-3500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega1[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				break;
			case 30000:
			//Dot 3500-9000
				DotNumber=55e2;
				DeltaThetaInitinital=-60e3;
				Omega0Initinital=20e3;
				Omega1Initinital=0;
				CarrierTracking(Ts,DotNumber,
								DeltaThetaInitinital,Omega0Initinital,Omega1Initinital,
								DetaTheta,Omega0,Omega1);
				Title = "DetaTheta dot 3501-9000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << DetaTheta[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega0 dot 3501-9000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega0[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega1 dot 3501-9000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega1[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
			break;
			case 40000:
			//Dot 9000-9500
				DotNumber=500;
				DeltaThetaInitinital=50e3;
				Omega0Initinital=20e3;
				Omega1Initinital=-80e3;
				CarrierTracking(Ts,DotNumber,
								DeltaThetaInitinital,Omega0Initinital,Omega1Initinital,
								DetaTheta,Omega0,Omega1);
				Title = "DetaTheta dot 9000-9500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << DetaTheta[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega0 dot 9000-9500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega0[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega1 dot 9000-9500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega1[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
			break;
			case 50000:
			//Dot 9500-15500
				DotNumber=60e2;
				DeltaThetaInitinital=50e3;
				Omega0Initinital=-20e3;
				Omega1Initinital=0;
				CarrierTracking(Ts,DotNumber,
								DeltaThetaInitinital,Omega0Initinital,Omega1Initinital,
								DetaTheta,Omega0,Omega1);
				Title = "DetaTheta dot 9500-15500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << DetaTheta[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega0 dot 9500-15500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega0[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega1 dot 9500-15500 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega1[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
			break;
			case 60000:
		    //Dot 15500-16000
				DotNumber=500;
				DeltaThetaInitinital=-70e3;
				Omega0Initinital=-20e3;
				Omega1Initinital=80e3;
				CarrierTracking(Ts,DotNumber,
								DeltaThetaInitinital,Omega0Initinital,Omega1Initinital,
								DetaTheta,Omega0,Omega1);
				Title = "DetaTheta dot 15500-16000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << DetaTheta[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega0 dot 15500-16000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega0[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega1 dot 15500-16000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega1[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
			break;
			case 70000:
			//Dot 16000-20000
				DotNumber=4e3;
				DeltaThetaInitinital=-70e3;
				Omega0Initinital=20e3;
				Omega1Initinital=0;
				CarrierTracking(Ts,DotNumber,
								DeltaThetaInitinital,Omega0Initinital,Omega1Initinital,
								DetaTheta,Omega0,Omega1);
				Title = "DetaTheta dot 16000-20000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << DetaTheta[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega0 dot 16000-20000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega0[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
				Title = "Omega1 dot 16000-20000 display as below:";
				cout << Title <<endl;
				for( int k = 1; k <DotNumber ; k = k + 1 ){
					cout << setw(13) << Omega1[k];
					if (k%10 == 0)
						cout << endl;}cout << endl;
			break;
			default:
				cout << "no money no compute" <<endl;
			}
	}

	int ret=0;
	// Execute (DUT) Function
	// Write the output results to a file
	// Check the results
	ret = system("diff --brief -w /home/caohy/work/Kalman/vivado_hls/KalmanFilter/output.dat /home/caohy/work/Kalman/medium/output.golden.dat");
	if (ret != 0) {
	printf("Test failed !!!\n");
	ret=1;
	} else {
	printf("Test passed !\n");
	}
	return ret;



	return 0;
}

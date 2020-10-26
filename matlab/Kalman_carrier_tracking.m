%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:Kalman filter for carrier tracking
% Author:CaoHuiyang at HTGD-THZ;email:caohy@htgd.com.cn
% creat at 20200714,Kalman filter for carrier tracking matlab program framework was created. 
% change at 20200721,Use P replace P0.
% change at 20200723,Modify P_pre vector to a matrix,add comments.
% change at 20200724,Figure Variable to express the compute result.
% change at August 12,2020 make Kg from verible to array in order to save
% the history to observe the process.
% Reference "Research on Carrier Tracking Technology of High Dynamic Navigation Signal Based on Kalman Filtering"program equation.
% Reference "An improved high dynamic square-root Kalman carrier track loop" setting parameters.
% Reference "Design of Carrier Tracking Loop based on Kalman Filtering" Update program with this document.
%%%%%%%%%%%%%%%%%Kalman Filter For Carrier Tracking%%%%%%%%%%%%%%%%%%%%%%%%
function Kalman_carrier_tracking
%%%%%%%%%%%%%%%%%%%%%%%%%%%Setting Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;
N=20000;      			        %Sample Dot
detav=0.001;					%detav
detaw=0.001;					%detaw
Ts=1*10^(-3);					%Sample Timing
A=[1,Ts,Ts^2/2;
   0,1,Ts;
   0,0,1];                      %Transfer Matrix
H=[1,Ts/2,Ts^2/6];			 	%Observe Matrix
%B=[Ts,0,0]';				    %System Parameter 
L=[1,0,0;0,1,0;0,0,1];			%Noise Matrix
Q=detav^2* [Ts^6/252,Ts^5/72,Ts^4/30;
			Ts^5/72 ,Ts^4/20,Ts^3/8;
			Ts^4/30 ,Ts^3/8 ,Ts^2/3];%Noise Convariance Q
%Q=[0,0,0;0,0,0;0,0,0];
R=detaw^2/Ts^4;				    %Noise Convariance R
%R=1;
%V=normrnd(0,detaq,[1 N])';		%Measure Noise
%W=normrnd(0,detar,[3 N]);		%Process Noise 
V=sqrt(R)*randn(1,N);		    %Measure Noise
W=sqrt(Q)*randn(3,N);		    %Process Noise 
X=zeros(3,N);					%System State
X(:,1)=[0,-20*10^(3),0];		%System State Initial Value
Z=zeros(1,N);					%Measure Value
Golden=zeros(1,N);	            %Measure Value round value
U=0;							%System Control Value
P0=[1/12,0,0;
	0,1*10^(-4),0;
	0,0,1*10^(-4)];				%System State Convariance Initial
P=zeros(3,3,N);					%System State Convariance Matrix
P_pre=zeros(3,3,N);             %Convariance Prediction Matrix
P_pre(:,:,1)=[1/12,0,0;
	0,1*10^(-4),0;
	0,0,1*10^(-4)];				%System State Convariance Initial
P(:,:,1)=P0;
Z(1)=H*X(:,1);					%Calculate the initial observations
Xkf=zeros(3,N);					%State Update
X_pre=zeros(3,N);				%State Prediction
Xkf(:,1)=X(:,1);
I=eye(3);
Kg=zeros(3,N);
%%%%%%%%%%%%%%%%%%%%%%%Kalman Filter Program Process%%%%%%%%%%%%%%%%%%%%%%%%%
for k=2:N
	if k==3000
		X(3,k-1)=80*10^(3);		%System State change Value
		Xkf(3,k-1)=X(3,k-1);
    elseif k==3500
		X(3,k-1)=0;				%System State change Value
		Xkf(3,k-1)=X(3,k-1);
	elseif k==9000
		X(3,k-1)=-80*10^(3);	%System State change Value
		Xkf(:,k-1)=X(:,k-1);
	elseif k==9500
		X(3,k-1)=0;				%System State change Value
		Xkf(:,k-1)=X(:,k-1);
	elseif k==15500
		X(3,k-1)=80*10^(3);		%System State change Value
		Xkf(:,k-1)=X(:,k-1);
    elseif k==16000
		X(3,k-1)=0;		        %System State change Value
		Xkf(:,k-1)=X(:,k-1);
	end
	X(:,k)=A*X(:,k-1)+L*W(:,k-1);				%State Equation-1
    Z(k)=H*X(:,k)+V(k);							%Observe Equation-2
	X_pre(:,k)=A*Xkf(:,k-1);    			    %(1)State Predicte Equation-3
    P_pre(:,:,k)=A*P(:,:,k-1)*A'+Q;   			%(2)Convariance Predicte Equation-4
    Kg(:,k)=P_pre(:,:,k)*H'*inv(H*P_pre(:,:,k)*H'+R);%(3)Kalman Gain Equation-5 
    Xkf(:,k)=X_pre(:,k)+Kg(:,k)*(Z(k)-H*X_pre(:,k)); %(4)State Update Equation-6
    P(:,:,k)=(I-Kg(:,k)*H)*P_pre(:,:,k);        %(5)Convariance Update Equation-7
end

messure_err_x=zeros(1,N);
kalman_err_x=zeros(1,N);
kalman_err_v=zeros(1,N);
for k=1:N
    messure_err_x(k)=Z(k)-X(1,k);
    kalman_err_x(k)=Xkf(1,k)-X(1,k);
    kalman_err_v(k)=Xkf(2,k)-X(2,k);
end

%$$$$$$$$$$$$$$$$$$$$$$output the reseult to the file$$$$$$$$$$$$$$$$$$$$$$$$ 
fileID = fopen('/home/caohy/work/Kalman/medium/output.golden.dat','w');  
Golden=round(X_pre(1,:));
for k=1:3000
    fprintf(fileID,'%d ',Golden(k));
end
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure For Exhibition%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
subplot(4,1,1);	
plot(Z,'+r');xlabel('N');title('Observe Equation DetaTheta--Z(1,k)');
subplot(4,1,2);	
plot(X(1,:),'og');xlabel('N');title('System State DetaTheta--X(1,k)');
subplot(4,1,3);	
plot(X_pre(1,:),'.b');xlabel('N');title('Predict System State DetaTheta--Xpre(1,k)');
subplot(4,1,4);	
plot(Xkf(1,:),'*y');xlabel('N');title('State Update Equation DetaTheta--Xkf(1,k)');

figure(2)
subplot(3,1,1);	
plot(X(2,:),'+c');xlabel('N');title('System State Omega0--X(2,k)');
subplot(3,1,2);	
plot(X_pre(2,:),'*m');xlabel('N');title('Predict System State Omega0--Xpre(2,k)');
subplot(3,1,3);	
plot(Xkf(2,:),'-k');xlabel('N');title('State Update Equation Omega0--Xkf(2,k)');

figure(3)
subplot(3,1,1);	
plot(X(3,:),'ok');xlabel('N');title('System State Omega1--X(3,k)');
subplot(3,1,2);	
plot(X_pre(3,:),'<g');xlabel('N');title('Predict System State Omega1--Xpre(3,k)');
subplot(3,1,3);	
plot(Xkf(3,:),'.b');xlabel('N');title('State Update Equation Omega1--Xkf(3,k)');

figure(4)
plot(V);
title('Messure Noise')
figure(5)
hold on,box on;
plot(messure_err_x,'-r.');
plot(kalman_err_x,'-g.');
legend('Measure Error','kalman Evaluted Error')
figure(6)
plot(kalman_err_v);
title('Doppler Shift Error')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


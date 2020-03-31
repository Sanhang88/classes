clear;
clc;
dim=2
% dim=3
A = [0,1;8.04915,-0.09255];
% A=[-0.022872,0.34878,0;0,0,1;-0.458771,0.458771,0.025332]
B=[0;-8.92329];
% B=[0.167254,0.167254;0,0;8.40879,8.40879];
C=eye(dim);
fi_actuator=[-0;8.92329];
fi_sensor=[0;-1];
% fi_actuator=[-0.167254;0;-8.40879];
% fi_sensor=[0;-1;0];

lamdai=-3.4;
lamda2=-3;
Afi_actuator=A*fi_actuator;
Cfi_actuator=C*fi_actuator;
Cfi_actuator_pinv=(Cfi_actuator'*Cfi_actuator)\Cfi_actuator';
Ci_actuator=(eye(dim)-Cfi_actuator*Cfi_actuator_pinv)*C;
Ai_actuator=A-(Afi_actuator-lamdai*fi_actuator)*Cfi_actuator_pinv*C;
A2_actuator=A-(Afi_actuator-lamda2*fi_actuator)*Cfi_actuator_pinv*C;
Mi_actuator=obsv(Ai_actuator,Ci_actuator);
qi_actuator=rank(Mi_actuator);
vi_actuator=rank(A)-qi_actuator
[V,D]=eig(Ai_actuator)
ii=1;
w_actuator=V(:,ii)

lamda_actuator=D(ii,ii)
Cw_actuator=C*w_actuator;
Cw_actuator_pinv=(Cw_actuator'*Cw_actuator)\Cw_actuator';
E=eye(dim);
I=eye(dim);
D_actuator=(A*w_actuator-lamda_actuator*w_actuator)*Cw_actuator_pinv+E*(I-Cfi_actuator*Cfi_actuator_pinv)
[V,D]=eig(A-D_actuator*C)
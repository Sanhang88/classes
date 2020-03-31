%文章“用矩阵奇异值分解设计鲁棒故障诊断观测器”中的例子。
clear;
clc;

%系统矩阵
A=[0 1;8.04915 -0.09255];
B=[0;-8.92329];
C=[1 0;0 1];

%建模误差
state_model = 1;            %模型状态，0为无建模误差，1为有建模误差
delta_A=[0 0; 1.48068 -0.00318]*state_model;
delta_B=[0;-0.04781]*state_model;

%求解输出反馈增益阵K
P=[-2;-5];
K=place(A,B,P)*inv(C)

%给出反馈后的系统矩阵x_dot=A1*x+B1*r 
A1 = A - B*K*C
B1 = B*K

%全维观测器设计，x_es_dot=A1*x_dot + B1*r +L*(y-y_es) 
M=[-10;-10];                     %观测器期望特征值
N=place(A1',C',M);               %对偶矩阵的反馈增益阵
L=N'                             %观测器输出反馈矩阵

%鲁棒观测器设计，
E=[delta_A delta_B];                       %故障矩阵E


[U,S,V]=svd(E);                            %对E进行奇异值分解
a=ndims(S)-length(nonzeros(S));
Q=U(:,a+1:end);                            %取U的后m列
H=Q'
W = H*C'*inv(C*C')

%故障设定，假定为传感器失效故障
fi = [0 0;0 -1];





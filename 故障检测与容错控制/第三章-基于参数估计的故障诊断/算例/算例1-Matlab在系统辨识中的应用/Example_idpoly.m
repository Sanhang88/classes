%idpoly函数的用法示例程序
clear;
clc;
% IDPOLY  Create IDPOLY model structure
% 
% M = IDPOLY(A,B,C,D,F,NoiseVariance,Ts)
% M = IDPOLY(A,B,C,D,F,NoiseVariance,Ts,'Property',Value,..)
% 
% M: returned as a  model structure object describing the model
%The variance of the white noise source e is NoiseVariance. Ts is the sample interval. 

%Ts不等于0时，对应离散模型，形式为 A(q) y(t) = [B(q)/F(q)] u(t-nk) + [C(q)/D(q)] e(t)
A = [1 -1.5 0.7];
B = [0 0.5 0 0.3; 0 0 1 0];
Ts =1;
M1 = idpoly( A,B )

%Ts=0时，对应连续模型，形式与离散模型类似
A = 1; 
B = [1 2;0 3]; 
C = 1; 
D = 1; 
F = [1 0;0 1]; 
Ts = 0;
M2 = idpoly( A,B,C,D,F,0,0 )

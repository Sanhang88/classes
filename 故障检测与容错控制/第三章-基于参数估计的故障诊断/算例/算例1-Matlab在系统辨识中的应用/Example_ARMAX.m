%“Matlab在系统辨识中的应用_吕秋霞”中的算例，最小二乘法
%数学模型为y(k)-1.5y(k-1)+0.705y(k-2)=0.065u(k-1)+0.084u(k-2)-0.008u(k-3)+e(k)
% -0.527e(k-1)+0.01e(K-2)
clear;
clc;
close all;

N = 10000;    %数据长度

%理想系统模型
A = [ 1 -1.5 0.705 ];           %输出项系数
% B = [ 0 0.065 0.084 -0.2 ];   %输入项系数
B = [ 0 0.065 0.084 ]; 
% C = [ 1 -0.527 0.01 ];          %误差项系数
C = 1;
M1 = idpoly(A,B,C);             %ARMAX模型

%绘制系统阶跃响应曲线
figure(1);
step(M1);
grid;
hold on;

%产生用于辨识的输入输出数据
U = iddata( [],idinput(N,'prbs') );       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
E = iddata( [],idinput(N,'rgs') );        %随机高斯白噪声序列作为噪声
Y1 = sim(M1,[U,E]);                       %输出数据
Z = iddata(Y1,U);

%ARMAX模型阶次的估计
NN = struc(1:2,1:4,1:4);
Loss_fun = arxstruc(Z,Z,NN);
order = selstruc(Loss_fun,'aic');
% order = [ 2,2,0,1 ];          %对应armax模型
% order = [2 2 1];              %对应arx模型

%ARMAX模型参数的估计（最小二乘法）
% Model_para = armax(Z,order);                %参数估计
Model_para = arx(Z,order);
present(Model_para);                        %显示辨识结果

figure(1);
step(Model_para,'r');grid;





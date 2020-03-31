%《系统辨识理论及应用》-李言俊，P56，例5.1，说明最小二乘法精度的结论：1、当不存在噪声时，估值精确;2、估值均方差随着噪声均方差增大而增大
%数学模型为y(k)-1.5y(k-1)+0.7y(k-2)=u(k-1)+0.5u(k-2)+e(k)
clear;
clc;
close all;

N = 127;    %数据长度

%理想系统模型
A = [ 1 -1.5 0.7 ];           %输出项系数
B = [ 0 1 0.5 ];              %输入项系数
C = 1;                        %误差项系数
M1 = idpoly(A,B,C);             %AR模型

%绘制系统阶跃响应曲线
figure(1);
step(M1);grid on;hold on;

%产生用于辨识的输入输出数据
U = idinput(N,'prbs') ;       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
sigma = 0.01;                                %噪声均方差
E = idinput(N,'rgs')*sigma;        %随机高斯白噪声序列作为噪声
Y1 = sim(M1,[U,E]);                       %输出数据
Z = iddata(Y1,U);


%ARMAX模型参数的估计（最小二乘法）
order = [ 2 2 1 ];
Model_para = arx(Z,order);
present(Model_para);                        %显示辨识结果
figure;
compare(Z,Model_para);                      %辨识结果与实际输出比较

figure(1);
step(Model_para,'r');grid on;





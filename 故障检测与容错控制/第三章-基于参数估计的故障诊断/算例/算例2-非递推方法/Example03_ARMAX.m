%《系统辨识理论及应用》-李言俊，P59，例5.3，说明当误差为相关噪声时，广义最小二乘是无偏估计
%数学模型为y(k)+0.5y(k-1)=u(k)+n(k)+0.5n(k-1)
%此时误差e(k)=n(k)+0.5n(k-1),e(k+1)=n(k+1)+0.5n(k),误差e(k)与e(k+1)显然相关
clear;
clc;
close all;

N = 500;    %数据长度

%理想系统模型
A = [ 1 0.5 ];               %输出项系数
B = 1;                       %输入项系数
C = [1 0.5];                 %误差项系数
M1 = idpoly(A,B,C);          %ARMAX模型

%绘制系统阶跃响应曲线
figure(1);
step(M1);grid on;hold on;

%产生用于辨识的输入输出数据
U = idinput(N,'prbs') ;       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
sigma = 0.2;                                %噪声均方差
E = idinput(N,'rgs')*sigma ;        %随机高斯白噪声序列作为噪声
Y1 = sim(M1,[U,E]);                       %输出数据
Z = iddata(Y1,U);


%ARMAX模型参数的估计（广义最小二乘法）
order = [ 1 1 1 0 ];
Model_para = armax(Z,order);
present(Model_para);                        %显示辨识结果
% figure;
% compare(Z,Model_para);                      %辨识结果与实际输出比较

figure(1);
step(Model_para,'r');grid on;





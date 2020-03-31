%用对偶原理求解全维观测器的算例
clear;
clc;

%原系统矩阵
A = [1 0 0;3 -1 1;0 2 0];
B = [2 1 1]';
C = [0 0 1];

%对偶系统矩阵
A_couple = A';
B_couple = C';
C_couple = B';

%求对偶系统的状态反馈增益阵K_couple
P = [-3;-4;-5]    %期望极点位置

K_couple = place(A_couple,B_couple,P)
G = K_couple'

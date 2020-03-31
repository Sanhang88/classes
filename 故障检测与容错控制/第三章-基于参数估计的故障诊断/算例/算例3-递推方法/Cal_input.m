%产生用于辨识的输入数据
clear;
clc;
close all;

N = 1023;
uu= idinput(N,'prbs') ;       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
uu = [(1:N)',uu];
sigma = 0.2;                                %噪声均方差
ee = idinput(N,'rgs')*sigma ;        %随机高斯白噪声序列作为噪声
ee = [[1:N]',ee];



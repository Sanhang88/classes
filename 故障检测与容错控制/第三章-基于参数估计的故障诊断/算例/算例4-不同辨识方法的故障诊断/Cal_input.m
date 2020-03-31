%产生用于辨识的输入输出数据
clear;
clc;


N = 1023;
Ts = 0.1;
num = N/Ts;
uu= idinput(num,'prbs') ;       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
% uu = [[1:num]',uu];
uu = [([1:num]*Ts)',uu];
sigma = 0.2;                                %噪声均方差
ee = idinput(num,'rgs')*sigma ;        %随机高斯白噪声序列作为噪声
ee = [([1:num]*Ts)',ee];
sim('MDL_example01');



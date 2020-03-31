%xample4_7校正设计T=0.01(串联超前校正和超前滞后校正控制器)
clear all;clc;
G0=tf(120,conv([1 0],[1 4]));
ts=0.01;
Gh=tf(1,[ts/2 1]);
G=G0*Gh;
gama=55;wc=15;                   %超前滞后校正控制器设计时的gama,wc;
Dcs=leadlagc(G,wc,gama,30,1)     %超前滞后校正控制器

% gama=50;wc=15;                     %串联超前校正控制器设计时的gama,wc;
% Dcs=leadczsp(3,G,[gama,wc])         %串联超前校正控制器
sysc=G*Dcs;
figure(1);bode(sysc);               %连续系统的频域响应
sys=feedback(sysc,1);
figure(2);step(sys);                %连续系统的阶跃响应曲线

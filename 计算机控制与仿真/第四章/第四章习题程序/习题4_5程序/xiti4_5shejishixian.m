%连续域—离散化设计xiti4-5校正设计T=0.01(串联超前校正和超前滞后校正控制器)
clear all;clc;
G0=tf(10,conv([1 0],[1 1]));
G=feedback(G0,1);
figure(1);bode(G0);grid on   %原系统的频域响应
figure(2);step(G);grid on    %原系统的阶跃响应曲线
figure(3);bode(G);grid on    %原闭环系统的带宽频率 
ts=0.01;
Gh=tf(1,[ts/2 1]);
G=G0*Gh
gama=55;wc=15;                           %串联超前校正控制器设计时的gama,wc;
Dcs=leadc(3,G,[gama,wc])                 %串联超前校正控制器
% gama=56;wc=20;                         %超前滞后校正控制器设计时的gama,wc;
% Dcs=leadlagc(G,wc,gama,10,1)           %超前滞后校正控制器
sysc=G*Dcs;
sys=feedback(sysc,1);
Dcz=c2d(Dcs,ts,'tustin')
Gcz=c2d(G0,ts,'zoh');
syscz=Dcz*Gcz;
sysz=feedback(syscz,1);
figure(4);step(sys);hold on;step(sysz,1);grid on         %连续系统与计算机控制系统的阶跃响应曲线
figure(5);bode(sysc);grid on                             %连续系统的频域响应
figure(6);bode(syscz);grid on                            %计算机控制系统的频域响应


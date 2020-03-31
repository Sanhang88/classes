%连续域—离散化设计xiti4-5校正设计T=0.02(串联超前校正)
clear all;clc;
G0=tf(10,conv([1 0],[1 1]));
G=feedback(G0,1);
ts=0.02;
Gh=tf(1,[ts/2 1]);
G=G0*Gh
Dcs=tf([2.65 1],[0.01 1])                 %串联超前校正控制器
sysc=G*Dcs;
sys=feedback(sysc,1);
Dcz=c2d(Dcs,ts,'tustin')
Gcz=c2d(G0,ts,'zoh');
syscz=Dcz*Gcz;
sysz=feedback(syscz,1);
figure(1);step(sys);hold on;step(sysz,1);grid on         %连续系统与计算机控制系统的阶跃响应曲线
figure(2);bode(sysc);grid on                             %连续系统的频域响应
figure(3);bode(syscz);grid on                            %计算机控制系统的频域响应


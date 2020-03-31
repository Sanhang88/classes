%连续域—离散化设计
clear all;clc;
G0=tf(120,conv([1 0],[1 4]));
G=feedback(G0,1);
figure(1);bode(G0);grid on
figure(2);step(G);grid on
figure(3);bode(G);grid on
ts=0.001;
Kp=8;Ki=0.05;Kd=0.4;
Dcs=tf([Kd Kp Ki],[1 0])
sysc=G*Dcs;
sys=feedback(sysc,1);
% Dcz=c2d(Dcs,ts,'tustin')
Dcz=tf([Kp*ts+Ki*ts*ts+Kd*ts -Kp*ts-2*Kd*ts Kd*ts],[ts -ts 0],ts,'variable','z')
Gcz=c2d(G0,ts,'zoh');
syscz=Dcz*Gcz;
[num,den]=tfdata(syscz,'v');
sysz=feedback(syscz,1);
figure(4);step(sys,1);hold on;step(sysz,1);grid on
% figure(5);dbode(num,den,ts);grid on
figure(5);bode(syscz);grid on







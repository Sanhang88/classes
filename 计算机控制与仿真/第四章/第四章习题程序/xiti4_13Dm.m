%扩充临界比例度法习题4_12  G0(s)=1/((2s+1)(5s+1))
clear all;close all;
ts=0.25;
sys=tf(1,[10 7 1]);
dsys=c2d(sys,ts,'z');
figure(1);
rlocus(dsys);
grid off;
[kr,pole]=rlocfind(dsys,0.8318+0.5543j)
wr=angle(pole(1))/ts
kp=0.6*kr
ki=kp*wr/pi
kd=kp*pi/(4*wr)
dsys_pid=kp+ki*tf([1,0],[1,-1],ts)*ts+kd*tf([1,-1],[1,0],ts)/ts;  %离散的PID控制器
dsysc=dsys*dsys_pid;                                             %校正后的离散开环系统
figure(2);
rlocus(dsysc);
grid off;
G=feedback(dsysc,1);
figure(3);
step(G);
figure(4);
rlocus(G);
grid off;




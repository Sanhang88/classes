%临界比例度法
clear all;close all;
num=[1];
den=conv(conv([1 0],[1 1]),[1 5]);
sys=tf(num,den)
figure(1);
sysk=feedback(sys,1);
step(sysk,30);
figure(2);
pzmap(sysk);
rlocus(sys);   %求解系统的穿越增益Kr和穿越频率ωr
[kr,pole]=rlocfind(sys)  %可计算出与根轨迹上极点（位置为ploe）相对应的根轨迹增益（kr）
% [kr,pole]=rlocfind(sys,2.236j)  %可计算出与根轨迹上极点（位置为ploe）相对应的根轨迹增益（kr）
grid off;
wr=imag(pole(2))
kp=0.6*kr;
kd=kp*pi/(4*wr);
ki=kp*wr/pi;
sys_pid=tf([kd,kp,ki],[1,0]);             %PID控制器
sysc=sys*sys_pid;                        %校正后的系统
figure(3);
rlocus(sysc);
grid off;
G=feedback(sysc,1);
figure(4);
step(G);
figure(5);
pzmap(G);
grid off;


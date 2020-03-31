%�ٽ�����ȷ�
clear all;close all;
num=[1];
den=conv(conv([1 0],[1 1]),[1 5]);
sys=tf(num,den)
figure(1);
sysk=feedback(sys,1);
step(sysk,30);
figure(2);
pzmap(sysk);
rlocus(sys);   %���ϵͳ�Ĵ�Խ����Kr�ʹ�ԽƵ�ʦ�r
[kr,pole]=rlocfind(sys)  %�ɼ��������켣�ϼ��㣨λ��Ϊploe�����Ӧ�ĸ��켣���棨kr��
% [kr,pole]=rlocfind(sys,2.236j)  %�ɼ��������켣�ϼ��㣨λ��Ϊploe�����Ӧ�ĸ��켣���棨kr��
grid off;
wr=imag(pole(2))
kp=0.6*kr;
kd=kp*pi/(4*wr);
ki=kp*wr/pi;
sys_pid=tf([kd,kp,ki],[1,0]);             %PID������
sysc=sys*sys_pid;                        %У�����ϵͳ
figure(3);
rlocus(sysc);
grid off;
G=feedback(sysc,1);
figure(4);
step(G);
figure(5);
pzmap(G);
grid off;


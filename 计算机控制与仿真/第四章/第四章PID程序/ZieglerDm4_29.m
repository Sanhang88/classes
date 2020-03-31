%�����ٽ�����ȷ�example4_29
clear all;clc;
ts=0.1;
sys=tf(1,conv([1 1],[1 2]));
dsys=c2d(sys,ts,'zoh');
[num,den]=tfdata(dsys,'v');
dsys=filt(num,den,ts);
dsys=zpk(dsys)
figure(1);
rlocus(dsys);
% pzmap(dsys)  %���Ʊ��ض�����㼫��λ��ͼ
grid off;
[kr,pole]=rlocfind(dsys,0.71+0.704j)
% [kr,pole]=rlocfind(dsys);
wr=angle(pole(1))/ts
kp=0.6*kr
ki=kp*wr/pi
kd=kp*pi/(4*wr)
dsys_pid=kp+ki*tf([1,0],[1,-1],ts)*ts+kd*tf([1,-1],[1,0],ts)/ts; %��ɢ��PID������
dsysc=dsys*dsys_pid                                             %У�������ɢ����ϵͳ
G=feedback(dsysc,1);
figure(2);
step(G);
figure(3);
rlocus(dsysc);
% pzmap(G)    %����ϵͳ�ıջ��㼫��λ��ͼ
grid off;





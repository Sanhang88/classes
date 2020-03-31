clear all;clc;
ts=0.1;
Gs=tf([10],conv([1,1],[1 2]))
% n1=[10];
% d1=[1 3 2];
% Gs=tf(n1,d1)
Gz=c2d(Gs,ts,'zoh')
[num,den]=tfdata(Gz,'v');
Gz=filt(num,den,ts);
Gz=zpk(Gz)
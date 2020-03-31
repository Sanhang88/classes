clear all;clc;
ts=0.005;
n1=[0.1647 1];
d1=[0.01637 1];
sys=tf(n1,d1)
dsys=c2d(sys,ts,'zoh');
Gz=zpk(dsys)


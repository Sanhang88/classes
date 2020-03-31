%Z±ä»¯
clear all;close all;
ts=0.01;
%sys=tf(conv([1.28 1],[0.5 1]),conv([64 1],[0.01 1]))
sys=tf([0.2 1],[0.02 1])
%sys=tf([0.1647 1],[0.01637 1])
%sys=tf([0.1441 1],[0.02472 1])
%sys=tf([14 10],[1 0])
%dsys=c2d(sys,ts,'imp')
dsys=c2d(sys,ts,'zoh')
%dsys=c2d(sys,ts,'tustin')

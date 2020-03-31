%½×Ô¾ÏìÓ¦ÇúÏß·¨example4_27
% clear all;close all;
K=8;Tf=360;tau=180;
kc=K*(tau/Tf)
kp=1.2/kc
ki=kp/(3*tau)
kd=kp*0.5*tau

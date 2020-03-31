%½×Ô¾ÏìÓ¦ÇúÏß·¨example4_28
clear all;clc;
K=167;Tf=1170;tau=70;
kc=K*(tau/Tf)
kp=1.2/kc
ki=kp/(3*tau)
kd=kp*0.5*tau

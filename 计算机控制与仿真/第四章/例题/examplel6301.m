%example6_7
clear all;close all;
ts=0.2;
n1=3.072;
d1=conv([1 0],[0.2 1]);
%d1=conv(conv([1 0],[1 8]),[1 16]);
sys=tf(n1,d1);                    %被控对象的传递函数G(s)
sigma=0.15;
zeta=((log(1/sigma))^2/((pi)^2+(log(1/sigma))^2))^(1/2)
zeta=0.52;
tts=1;
wn=3/(zeta*tts)
wn=6;
p=[1 2*zeta*wn wn*wn];
roots(p)
s1=-3.12+5.125i
kc=5;
Gc=rtloc(1,sys,[s1]);
Gz=zbh(Gc,ts)
%Gc=rtloc(2,sys,[s1,kc]);
%sys1=Gc*sys;
sys1=Gz1*Gz;
figure(1);
G=feedback(sys1,1);
step(G);
[y,t]=step(G);
[sigma,tp,ts]=perf(1,y,t)
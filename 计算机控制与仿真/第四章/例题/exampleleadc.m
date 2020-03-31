%²¨µÂÍ¼Éè¼Æexample6_1
clear all;close all;
n1=120;
%d1=conv([1 0],[1 4]);
d1=conv(conv([1 0],[1 4]),[0.05 1]);
%d1=conv(conv([1 0],[1 1]),[1 2]);
sys=tf(n1,d1);
figure(1);
%margin(sys);
bode(sys);
[mag,phase,W]=bode(sys);
gama0=50;
[mu,pu]=bode(sys,W);
gama1=gama0+5;
phi_m=gama1*pi/180;
alfa=(1-sin(phi_m))/(1+sin(phi_m))
adb=20*log10(mu);
am=10*log10(alfa);
Wc=spline(adb,W,am)
T=1/(Wc*sqrt(alfa));
Gc=tf([T 1],[alfa*T 1])
sys1=sys*Gc;
figure(2);
%margin(sys1);
bode(sys1);


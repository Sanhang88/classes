%²¨µÂÍ¼Éè¼Æexample4-7
clear all;clc;
n1=120;
d1=conv(conv([1 0],[1 4]),[0.005 1]);
% d1=conv([1 0],[1 4]);
sys=tf(n1,d1)
figure(1);
bode(sys);
gama=50;wc=15;
Gc=leadczsp(2,sys,[wc])
% Gc=leadczsp(1,sys,[gama])
% Gc=leadlagc(sys,wc,gama,30,1)
sys1=sys*Gc;
figure(2);
bode(sys1);
figure(3);
G=feedback(sys1,1);
step(G);
[y,t]=step(G);
[sigma,tp,ts]=perfzsp(1,y,t)
%²¨µÂÍ¼Éè¼Æexample4-7xiti
clear all;close all;
n1=10;
%d1=conv(conv([1 0],[1 1]),[1 2]);
d1=conv(conv([1 0],[1 1]),[0.05 1]);
%d1=conv([1 0],[1 1]);
sys=tf(n1,d1)
figure(1);
bode(sys);
% gama=45;wc=4.4;
gama=49;wc=15;
% Gc=leadczsp(1,sys,[gama])
% Gc=leadczsp(3,sys,[gama,wc])
Gc=leadlagc(sys,wc,gama,10,1)
sys1=sys*Gc;
figure(2);
bode(sys1);
figure(3);
G=feedback(sys1,1);
step(G);
[y,t]=step(G);
[sigma,tp,ts]=perfzsp(1,y,t)
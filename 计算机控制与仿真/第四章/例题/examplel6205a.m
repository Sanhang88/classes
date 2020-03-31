%²¨µÂÍ¼Éè¼Æexample6_5
clear all;close all;
n1=20;
%d1=conv(conv([1 0],[1 1]),[1 2]);
d1=conv(conv([1 1],[1 2]),[0.05 1]);
%d1=conv([1 0],[1 1]);
sys=tf(n1,d1)
figure(1);
bode(sys);
gama=45;wc=18;
%Gc=leadc(1,sys,[gama])
%Gc=lagc(1,sys,[gama])
%Gc=lagc(2,sys,[wc])
Gc=leadlagc(sys,wc,gama,10,3)
sys1=sys*Gc;
figure(2);
bode(sys1);
figure(3);
G=feedback(sys1,1);
step(G);
[y,t]=step(G);
[sigma,tp,ts]=perfzsp(1,y,t)
%²¨µÂÍ¼Éè¼Æexample4_7xiti1
clear all;close all;
n1=12*180;
d1=conv(conv([1 0],[1 6]),conv([1 2],[0.005 1]));
sys=tf(n1,d1)
figure(1);
bode(sys);
gama=45;wc=3.8;
Gc=leadlagc(sys,wc,gama,180,1)
sys1=sys*Gc;
figure(2);
bode(sys1);
figure(3);
G=feedback(sys1,1);
step(G);
[y,t]=step(G);
[sigma,tp,ts]=perfzsp(1,y,t)
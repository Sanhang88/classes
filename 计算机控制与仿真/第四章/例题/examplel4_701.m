%²¨µÂÍ¼Éè¼Æexample4_701
clear all;close all;
n1=120;
d1=conv(conv([1 0],[1 4]),[0.05 1]);
sys=tf(n1,d1)
figure(1);
bode(sys);
gama=45;wc=4.4
%wc=10;
Gc=leadlagc(sys,wc,gama,30,1)

ts=0.1;
dGc=c2d(Gc,ts,'tustin');
Gz=zpk(dGc)

sys1=sys*Gc;
figure(2);
bode(sys1);
figure(3);
G=feedback(sys1,1);
step(G);
[y,t]=step(G);
[sigma,tp,ts]=perfzsp(1,y,t)
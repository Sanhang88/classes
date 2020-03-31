%波德图设计example6_5
clear all;close all;
n1=120;
%d1=conv(conv(conv([1 0],[0.007 1]),[0.00167]),[0.0063 0.9063 1]);
d1=conv(conv([1 0],[1 4]),[0.05 1]);
%d1=conv([1 0],[1 1]);
sys=tf(n1,d1);
%sys=tf([180],conv(conv([1 0],[1/6 1]),[1/2 1])); %被控对象的传递函数G(s)
figure(1);
bode(sys);
gama=45;wc=20;
%Gc=lagc(1,sys,[gama+6])
%Gc=lagc(2,sys,[wc])
%Gc=leadlagc(sys,wc,gama,30,3)
Gc=leadczsp(1,sys,[wc])
sys1=sys*Gc;
figure(2);
bode(sys1);
figure(3);
G=feedback(sys1,1);
step(G);
[y,t]=step(G);
[sigma,tp,ts]=perfzsp(1,y,t)
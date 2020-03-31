%ÀýÌâ4_11
clear all;clc;
ts=0.01;
G0=tf(120,conv([1 0],[1 4]))
% G0=tf(10,conv([1 1],[1 2]))
Gh=tf(1,[ts/2 1]);
G=G0*Gh;
Gz=c2d(G0,ts,'zoh');
[numz,denz]=tfdata(Gz,'v');
Gzz=tf([numz],[denz],ts,'variable','z^-1');
Gzz=minreal(Gzz);
Gz=zpk(Gzz)
Rs=tf([1],[1 0]);
Rz=c2d(Rs,ts,'imp');
Dz=1;
phiz=minreal(Dz*Gz/(1+Dz*Gz))
y=limit(phiz,z,1)

% syms z Kp;
% Gz=0.0453*(z+0.904)/(z-0.905)*(z-0.819)
% Rz=z/(z-1)
% Dz=Kp;
% phiz=Dz*Gz/(1+Dz*Gz);
% yz=simple(phiz*Rz);
% pretty(yz)
% y=limit((z-1)*yz,z,1)



% Gz=lsh(Gs,ts)
% phiz=tf([0 0.397 0.397*1.516],[1],ts,'variable','z^-1')
% Dz=minreal((1/Gz)*phiz/(1-phiz))
% Rs=tf([1],[1 0]);
% Rz=c2d(Rs,ts,'imp');
% yzz=minreal(phiz*Rz);
% [numy,deny]=tfdata(yzz,'v');
% yyz=zpk(yzz)
% zero=zeros(1,d);
% y=filter(numy,deny,[1 zero]);
% Yz=filter(numy,deny,[1 0 0 0 0 0]);
% yz=tf([Yz],[1],ts,'variable','z^-1')
% uz=minreal(yzz/Gz);
% [numu,denu]=tfdata(uz,'v');
% uuz=zpk(uz)
% u=filter(numu,denu,[1 zero]);
% Uz=filter(numu,denu,[1 0 0 0 0 0]);
% uz=tf([Uz],[1],ts,'variable','z^-1')
% for k=0:1:d
%     rin(k+1)=1;
%     time(k+1)=k*ts;
%     e(k+1)=rin(k+1)-y(k+1);
% end
% figure(1);plot(time,rin,'r');hold on;stairs(time,y,'b')
% figure(2);stairs(time,u);



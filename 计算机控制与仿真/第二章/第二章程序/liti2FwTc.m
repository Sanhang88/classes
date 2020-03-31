%���������źŵ�����Ƶ������
clear all;close all;
T=0.1;
ws=2*pi/T;
m=10;
w=-ws*m:1:ws*m;
n=length(w);
pw=zeros(1,n);
for i=1:n
    pw(1,i)=Fw(w(i),0);
end
pwmin=abs(pw-Fw(0,0)*0.05);
[minvalue,pos]=min(pwmin);
wc=abs(w(pos));
Tc=2*pi/(2*wc);
axes('fontsize',14,'LineWidth',2)
plot(w,pwmin+Fw(0,0)*0.05,'r-','LineWidth',2);
grid on
xlabel('\fontsize{14}\bf��Ƶ�ʦ�(��λ:rad/sec)');
ylabel('\fontsize{14}\fontname{����}��ֵ');
title('\fontsize{14}\bf���������źŵ�����Ƶ������');

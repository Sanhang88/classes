%无限连续信号的有限频谱曲线
clear all;clc;
T=0.01;
ws=2*pi/T;
w=-ws*0.25:1:ws*0.25;
n=length(w);
pw=zeros(1,n);
for i=1:n
    pw(1,i)=Fw(w(i),0);
end
pwmin=abs(pw-Fw(0,0)*0.1);

[minvalue,pos]=min(pwmin);

wc=abs(w(pos));
Tc=2*pi/(2*wc);

axes('fontsize',14,'LineWidth',2)
plot(w,pwmin+Fw(0,0)*0.1,'r-','LineWidth',2);
grid on
xlabel('\fontsize{14}\bf角频率ω(单位:rad/sec)');
ylabel('\fontsize{14}\fontname{黑体}幅值');
title('\fontsize{14}\bf无限连续信号的有限频谱曲线');

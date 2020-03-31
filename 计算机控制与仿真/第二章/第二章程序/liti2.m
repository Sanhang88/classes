%无限频谱采样信号的混叠
clear all;clc;
T=0.1;
ws=2*pi/T;
m=5;
w=-ws*m:1:ws*m;
n=length(w);
cut_length=floor(n/4);
p=2*m+1;
pw=zeros(p,n);
for j=1:1:p
    for i=1:n
        pw(j,i)=Fw1(T,w(i),(j-m-1)*ws);
    end
end
spw=zeros(1,n);
for i=1:n
    for j=1:1:p
        spw(i)=spw(i)+pw(j,i);
    end
end
axes('fontsize',14,'LineWidth',2)
plot(w,spw,'b-',w,pw,'r-','LineWidth',2);
legend('\fontname{黑体}\fontsize{16}无限频谱采样信号的混叠','无限频谱采样信号');
grid on;
xlabel('\fontsize{14}\bf角频率ω(单位:rad/sec)');
ylabel('\fontsize{14}\fontname{黑体}幅值');
title('\fontsize{14}\bf采样信号的频谱');

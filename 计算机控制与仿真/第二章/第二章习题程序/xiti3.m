% ����Ƶ�ײ����źŵĻ��
clear all;close all;
T=0.01;
ws=2*pi/T;
w=-ws*4:1:ws*4;
n=length(w);
cut_length=floor(n/4);
pw=zeros(21,n);
for j=1:1:21
    for i=1:n
        pw(j,i)=Fw1(T,w(i),(j-11)*ws);
    end
end
spw=zeros(1,n);
for i=1:n
    for j=1:1:21
        spw(i)=spw(i)+pw(j,i);
    end
end
axes('fontsize',16,'LineWidth',2)
plot(w,spw,'b-',w,pw,'r-','LineWidth',2);
grid on;
xlabel('\fontsize{16}\bf��Ƶ�ʦ�(��λ:rad/sec)');
ylabel('\fontsize{16}\fontname{����}��ֵ');
title('\fontsize{16}\bf����Ƶ�ײ����źŵĻ��');

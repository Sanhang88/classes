%����Ƶ�ײ����źŵĻ��
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
legend('\fontname{����}\fontsize{16}����Ƶ�ײ����źŵĻ��','����Ƶ�ײ����ź�');
grid on;
xlabel('\fontsize{14}\bf��Ƶ�ʦ�(��λ:rad/sec)');
ylabel('\fontsize{14}\fontname{����}��ֵ');
title('\fontsize{14}\bf�����źŵ�Ƶ��');

%�����źŵ�����Ƶ��
clear all;close all;
T=0.01;
ws=2*pi/T;
w=-ws*0.25:1:ws*0.25;
n=length(w);
cut_length=floor(n/4);
pw=zeros(21,n);
for j=1:1:21
    for i=1:n
        pw(j,i)=Fw1(T,w(i),(j-11)*ws);
    end
end
for j=1:1:21
    for i=1:n
        if pw(j,i)<Fw1(T,0,0)*0.1
           pw(j,i)=0;
        end
    end
end
spw=zeros(1,n);
for i=1:n
    for j=1:1:21
        spw(i)=spw(i)+pw(j,i);
    end
end
axes('fontsize',16,'LineWidth',2)
% plot(w,pw(5,:),'r-',w,pw(6,:),'r-',w,pw(7,:),'r-',w,pw(8,:),'r-',w,pw(9,:),'r-',w,pw(10,:),'r-',w,pw(11,:),'r-',w,pw(12,:),'r-',w,pw(13,:),'r-',w,pw(14,:),'r-',w,pw(15,:),'r-',w,spw,'b')
plot(w([cut_length:n-cut_length]),spw([cut_length:n-cut_length]),'r','LineWidth',2)
grid on;
xlabel('\fontsize{16}\bf��Ƶ�ʦ�(��λ:rad/sec)');
ylabel('\fontsize{16}\fontname{����}��ֵ');
title('\fontsize{16}\bf�����źŵ�����Ƶ��');

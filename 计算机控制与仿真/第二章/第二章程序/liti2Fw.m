%�����źŵ�Ƶ������
clear all;clc;
T=0.1;
ws=2*pi/T;
m=10;
w=-ws*m:1:ws*m;
n=length(w);
for i=1:n
    pw(i)=Fw(w(i),0);
end
axes('fontsize',14,'LineWidth',2)
plot(w,pw,'r-','LineWidth',2);
grid on
xlabel('\fontsize{14}\bf��Ƶ�ʦ�(��λ:rad/sec)');
ylabel('\fontsize{14}\fontname{����}��ֵ');
title('\fontsize{14}\bf�����źŵ�Ƶ��');



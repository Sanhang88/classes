figure(1)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDtestu(:,1),DSQPIDtestu(:,3),'k-','LineWidth',3);
hold on
plot(DSQPIDtestu(:,1),DSQPIDtestu(:,2),'r-','LineWidth',3);
legend('ƫ���ж�','�����ж�');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}��ֵ')
title('\fontsize{18}\fontname{����}�������Ƚ�')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDtesty(:,1),DSQPIDtesty(:,2),'r-','LineWidth',3);
hold on
plot(DSQPIDtesty(:,1),DSQPIDtesty(:,3),'k-','LineWidth',3);
legend('�����ж�','ƫ���ж�');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}ϵͳ����/���')
title('\fontsize{18}\fontname{����}�����ж���ƫ���жϵ�����/�����Ӧ')

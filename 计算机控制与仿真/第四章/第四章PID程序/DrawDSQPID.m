figure(1)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDu(:,1),DSQPIDu(:,2),'r-','LineWidth',3);
hold on
plot(DSQPIDu(:,1),DSQPIDu(:,3),'k-','LineWidth',3);
legend('��׼PID�����㷨������','�������Ļ��ַ���PID�����㷨������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}��ֵ')
title('\fontsize{18}\bf�������Ƚ�')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDry(:,1),DSQPIDry(:,2),'r-','LineWidth',3);
hold on
plot(DSQPIDry(:,1),DSQPIDry(:,3),'k-','LineWidth',3);
plot(DSQPIDry(:,1),DSQPIDry(:,4),'b-','LineWidth',3);
legend('��׼PID�����㷨','�������Ļ��ַ���PID�����㷨','step');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}ϵͳ����/���')
title('\fontsize{18}\bf��׼PID�����㷨�ʹ������Ļ��ַ���PID�����㷨����/�����Ӧ')

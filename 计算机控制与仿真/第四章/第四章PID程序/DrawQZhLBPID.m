figure(1);
axes('fontsize',18,'LineWidth',6)
plot(QZhLBPID(:,1),QZhLBPID(:,2),'r-','LineWidth',3);
hold on
plot(QZhLBPID(:,1),QZhLBPID(:,3),'m-','LineWidth',3);
legend('�˲��������','�˲�ǰ������');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}��ֵ');
title('\fontsize{18}\bf�˲�ǰ/�˲���������ź�');

figure(2);
axes('fontsize',18,'LineWidth',6)
plot(QZhLBPIDry(:,1),QZhLBPIDry(:,2),'r-','LineWidth',3);
hold on
plot(QZhLBPIDry(:,1),QZhLBPIDry(:,3),'m-','LineWidth',3);
legend('���','����');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���ֵ');
title('\fontsize{18}\bf����ֵ��ǰֵ�˲�������/���');

figure(3);
axes('fontsize',18,'LineWidth',6)
plot(QZhLBPIDPID(:,1),QZhLBPIDPID(:,2),'r-','LineWidth',3);
hold on
plot(QZhLBPIDPID(:,1),QZhLBPIDPID(:,3),'m-','LineWidth',3);
grid on
legend('��׼PID�����㷨�����','����ֵ��ǰֵ�˲��������');
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}��ֵ');
title('\fontsize{18}\bf����ֵ��ǰֵ�˲����ͱ�׼PID�����㷨�����');


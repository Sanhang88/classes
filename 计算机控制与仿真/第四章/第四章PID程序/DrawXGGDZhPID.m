figure(1);
axes('fontsize',18,'LineWidth',6)
plot(XGGDZhPIDu(:,1),XGGDZhPIDu(:,2),'r-','LineWidth',2);
hold on
plot(XGGDZhPIDu(:,1),XGGDZhPIDu(:,3),'k-','LineWidth',4);
legend('\fontname{����}\fontsize{16}�޸��㷨�Ŀ������','��׼PID�����㷨�Ŀ������');
grid on
xlabel('\fontsize{14}\bfʱ��T(��λ:S)');
ylabel('\fontsize{14}\fontname{����}��ֵ');
title('\fontsize{14}\bf�޸��㷨�жԸ���ֵ�仯���е���ͱ�׼PID���ƵĿ������');

figure(2);
axes('fontsize',18,'LineWidth',6)
plot(XGGDZhPIDry(:,1),XGGDZhPIDry(:,2),'r-','LineWidth',3);
hold on
plot(XGGDZhPIDry(:,1),XGGDZhPIDry(:,3),'k-','LineWidth',3);
grid on
xlabel('\fontsize{14}\bfʱ��T(��λ:S)');
ylabel('\fontsize{14}\fontname{����}����/���ֵ');
title('\fontsize{14}\bf�޸��㷨�жԸ���ֵ�仯���е��������/���');

figure(3);
axes('fontsize',18,'LineWidth',6)
plot(PID(:,1),PID(:,2),'r-','LineWidth',3);
hold on
plot(PID(:,1),PID(:,3),'k-','LineWidth',3);
grid on
xlabel('\fontsize{14}\bfʱ��T(��λ:S)');
ylabel('\fontsize{14}\fontname{����}����/���ֵ');
title('\fontsize{14}\bf��׼PID�����㷨������/���');


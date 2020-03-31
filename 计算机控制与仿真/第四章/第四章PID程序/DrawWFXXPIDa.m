figure(1);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDau(:,1),WFXXPIDau(:,2),'r-','LineWidth',2);
hold on
plot(WFXXPIDau(:,1),WFXXPIDau(:,3),'k-','LineWidth',3);
legend('\fontname{����}\fontsize{18}��׼PID�����㷨�Ŀ������','΢�����е�PID�������');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}��ֵ');
title('\fontsize{18}\bf΢�����е�PID�����㷨���׼PID�����㷨������');

figure(2);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDPIDay(:,1),WFXXPIDPIDay(:,2),'r-','LineWidth',4);
hold on
plot(WFXXPIDPIDay(:,1),WFXXPIDPIDay(:,3),'k-','LineWidth',4);
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���ֵ');
title('\fontsize{18}\bf΢�����е�PID�����㷨���׼PID�����㷨������/���');

figure(3);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDary(:,1),WFXXPIDary(:,2),'r-','LineWidth',3);
hold on
plot(WFXXPIDary(:,1),WFXXPIDary(:,3),'k-','LineWidth',3);
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���ֵ');
title('\fontsize{18}\bf΢�����е�PID�����㷨������/���');


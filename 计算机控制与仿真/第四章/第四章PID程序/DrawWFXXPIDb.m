figure(1);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDbu(:,1),WFXXPIDbu(:,2),'m-','LineWidth',2);
hold on
plot(WFXXPIDbu(:,1),WFXXPIDbu(:,3),'k-','LineWidth',3);
legend('\fontname{����}\fontsize{18}��׼PID�����㷨�Ŀ������','΢�����е�PID�������');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}��ֵ');
title('\fontsize{18}\bf΢�����е�PID�����㷨���׼PID�����㷨������');

figure(2);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDbry(:,1),WFXXPIDbry(:,2),'r-','LineWidth',4);
hold on
plot(WFXXPIDbry(:,1),WFXXPIDbry(:,3),'k-','LineWidth',4);
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���ֵ');
title('\fontsize{18}\bf΢�����е�PID�����㷨������/���');

figure(3);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDPIDby(:,1),WFXXPIDPIDby(:,2),'r-','LineWidth',3);
hold on
plot(WFXXPIDPIDby(:,1),WFXXPIDPIDby(:,3),'k-','LineWidth',3);
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���ֵ');
title('\fontsize{18}\bf΢�����е�PID�����㷨���׼PID�����㷨������/���');


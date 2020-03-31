figure(1)
axes('fontsize',18,'LineWidth',6)
plot(Ziegler(:,1),Ziegler(:,2),'r-','LineWidth',4);
hold on
plot(Ziegler(:,1),Ziegler(:,3),'b-','LineWidth',4);
legend('step','阶跃响应');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输入/输出')
title('\fontsize{18}\bf临界比例度法')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(ZieglerPID(:,1),ZieglerPID(:,2),'r-','LineWidth',4);
hold on
plot(ZieglerPID(:,1),ZieglerPID(:,3),'b-','LineWidth',4);
legend('step','阶跃响应');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输入/输出')
title('\fontsize{18}\bf精细调整后')

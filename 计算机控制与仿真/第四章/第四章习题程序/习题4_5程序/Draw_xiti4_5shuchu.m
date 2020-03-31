%连续系统与计算机控制系统输出随时间的变化曲线
figure
axes('fontsize',18,'LineWidth',6)
plot(yyy(:,1),yyy(:,2),'r--','LineWidth',4);
hold on
plot(yyy(:,1),yyy(:,3),'k-','LineWidth',4);
grid on
legend('\fontsize{18}\fontname{黑体}连续系统','\fontsize{18}\fontname{黑体}计算机控制系统');
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}连续系统/计算机控制系统输出')
title('\fontsize{18}\fontname{黑体}连续系统与计算机控制系统输出随时间的变化')

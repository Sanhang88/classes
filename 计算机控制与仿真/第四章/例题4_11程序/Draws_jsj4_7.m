figure
plot(yyy(:,1),yyy(:,2),'k--','LineWidth',2);
hold on
plot(yyy(:,1),yyy(:,3),'k-','LineWidth',2);
grid on
legend('连续系统','计算机控制系统');
xlabel ('时间T(单位:S)')
ylabel ('连续系统/计算机控制系统输出')
title('连续系统与计算机控制系统输出随时间的变化')


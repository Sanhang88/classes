figure
axes('fontsize',16,'LineWidth',3)
plot(PIDtu4_25(:,1),PIDtu4_25(:,2),'y-','LineWidth',3);
hold on
plot(PIDtu4_25(:,1),PIDtu4_25(:,3),'m-','LineWidth',3);
legend('kp=1,ki=1,','kp=1,ki=0.5');
grid on
xlabel ('\fontsize{16}\bf时间T(单位:S)')
ylabel ('\fontsize{16}\fontname{黑体}系统输出')
title('\fontsize{16}\fontname{黑体}不同积分时间控制的阶跃响应')


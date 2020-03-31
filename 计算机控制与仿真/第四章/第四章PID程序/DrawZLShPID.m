figure
axes('fontsize',16,'LineWidth',6)
plot(ZLShPID(:,1),ZLShPID(:,2),'y-','LineWidth',3);
hold on
plot(ZLShPID(:,1),ZLShPID(:,3),'m-','LineWidth',3);
legend('输入信号','输出信号');
grid on
xlabel ('\fontsize{16}\bf时间T(单位:S)')
ylabel ('\fontsize{16}\fontname{黑体}系统输入/输出')
title('\fontsize{16}\bf位置式PID控制阶跃响应')


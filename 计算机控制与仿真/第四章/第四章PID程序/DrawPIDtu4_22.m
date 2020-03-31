figure
axes('fontsize',16,'LineWidth',6)
plot(PIDtu4_22(:,1),PIDtu4_22(:,2),'y-','LineWidth',3);
hold on
plot(PIDtu4_22(:,1),PIDtu4_22(:,3),'m-','LineWidth',3);
legend('step','kp=1,ki=1');
grid on
xlabel ('\fontsize{16}\bf时间T(单位:S)')
ylabel ('\fontsize{16}\fontname{黑体}系统输入/输出')
title('\fontsize{16}\fontname{黑体}比例积分控制的阶跃响应')


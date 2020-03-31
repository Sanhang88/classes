figure
axes('fontsize',16,'LineWidth',6)
plot(PIDtu4_28(:,1),PIDtu4_28(:,2),'y-','LineWidth',3);
hold on
plot(PIDtu4_28(:,1),PIDtu4_28(:,3),'m-','LineWidth',3);
legend('step','kp=1,ki=0.3,kd=0.5');
grid on
xlabel ('\fontsize{16}\bf时间T(单位:S)')
ylabel ('\fontsize{16}\fontname{黑体}系统输入/输出')
title('\fontsize{16}\fontname{黑体}比例积分微分控制的阶跃响应')


figure
axes('fontsize',16,'LineWidth',6)
plot(PIDtu4_17(:,1),PIDtu4_17(:,2),'b-','LineWidth',3);
hold on
plot(PIDtu4_17(:,1),PIDtu4_17(:,3),'m-','LineWidth',3);
legend('step','kp=2');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}系统输入/输出')
title('\fontsize{18}\fontname{黑体}比例控制的阶跃响应')


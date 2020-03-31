figure(1)
axes('fontsize',18,'LineWidth',6)
plot(YXPChFPIDI(:,1),YXPChFPIDI(:,2),'b-','LineWidth',3);
hold on
plot(YXPChFPIDI(:,1),YXPChFPIDI(:,3),'m-','LineWidth',3);
legend('有效偏差法积分项','位置式PID控制算法积分项');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}积分项')
title('\fontsize{18}\bf有效偏差法和位置式PID控制算法积分项比较')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(YXPChFPIDu(:,1),YXPChFPIDu(:,2),'b-','LineWidth',3);
hold on
plot(YXPChFPIDu(:,1),YXPChFPIDu(:,3),'m-','LineWidth',3);
legend('有效偏差法控制量','位置式PID控制算法控制量');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}控制量')
title('\fontsize{18}\bf有效偏差法和位置式PID控制算法控制项比较')

figure(3)
axes('fontsize',18,'LineWidth',6)
plot(YXPChFPIDy(:,1),YXPChFPIDy(:,2),'b-','LineWidth',3);
hold on
plot(YXPChFPIDy(:,1),YXPChFPIDy(:,3),'m-','LineWidth',3);
plot(YXPChFPIDy(:,1),YXPChFPIDy(:,4),'r-','LineWidth',3);
legend('step','有效偏差法','位置式PID控制算法');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}系统输入/输出')
title('\fontsize{18}\bf有效偏差法和位置式PID控制算法输入/输出比较')

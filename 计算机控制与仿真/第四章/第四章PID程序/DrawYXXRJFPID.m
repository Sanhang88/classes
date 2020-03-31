figure(1)
axes('fontsize',18,'LineWidth',6)
plot(YXXRJFPIDI(:,1),YXXRJFPIDI(:,2),'y-','LineWidth',3);
hold on
plot(YXXRJFPIDI(:,1),YXXRJFPIDI(:,3),'m-','LineWidth',3);
legend('遇限削弱积分法积分项','位置式PID控制算法积分项');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}积分项')
title('\fontsize{18}\bf积分项比较')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(YXXRJFPID(:,1),YXXRJFPID(:,2),'c-','LineWidth',3);
hold on
plot(YXXRJFPID(:,1),YXXRJFPID(:,3),'y-','LineWidth',3);
plot(YXXRJFPID(:,1),YXXRJFPID(:,4),'m-','LineWidth',3);
legend('step','遇限削弱积分法','位置式PID控制算法');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}系统输入/输出')
title('\fontsize{18}\bf遇限削弱积分PID控制算法')

figure(3)
axes('fontsize',18,'LineWidth',6)
plot(YXXRJFPIDu(:,1),YXXRJFPIDu(:,2),'y-','LineWidth',3);
hold on
plot(YXXRJFPIDu(:,1),YXXRJFPIDu(:,3),'m-','LineWidth',3);
legend('遇限削弱积分法控制量','位置式PID控制算法控制量');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}积分项')
title('\fontsize{18}\bf积分项比较')
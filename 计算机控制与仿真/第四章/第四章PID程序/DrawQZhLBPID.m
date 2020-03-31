figure(1);
axes('fontsize',18,'LineWidth',6)
plot(QZhLBPID(:,1),QZhLBPID(:,2),'r-','LineWidth',3);
hold on
plot(QZhLBPID(:,1),QZhLBPID(:,3),'m-','LineWidth',3);
legend('滤波后的输入','滤波前的输入');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}幅值');
title('\fontsize{18}\bf滤波前/滤波后的输入信号');

figure(2);
axes('fontsize',18,'LineWidth',6)
plot(QZhLBPIDry(:,1),QZhLBPIDry(:,2),'r-','LineWidth',3);
hold on
plot(QZhLBPIDry(:,1),QZhLBPIDry(:,3),'m-','LineWidth',3);
legend('输出','输入');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}输入/输出值');
title('\fontsize{18}\bf给定值的前值滤波法输入/输出');

figure(3);
axes('fontsize',18,'LineWidth',6)
plot(QZhLBPIDPID(:,1),QZhLBPIDPID(:,2),'r-','LineWidth',3);
hold on
plot(QZhLBPIDPID(:,1),QZhLBPIDPID(:,3),'m-','LineWidth',3);
grid on
legend('标准PID控制算法的输出','给定值的前值滤波法的输出');
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}幅值');
title('\fontsize{18}\bf给定值的前值滤波法和标准PID控制算法的输出');


figure(1)
axes('fontsize',18,'LineWidth',6)
stairs(JFFLZhPID(:,1),JFFLZhPID(:,2),'r-');
hold on
stairs(JFFLZhPID(:,1),JFFLZhPID(:,3),'m-');
stairs(JFFLZhPID(:,1),JFFLZhPID(:,4),'b-');
legend('step','位置式PID控制算法','积分分离法');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输入/输出')
title('\fontsize{18}\bf积分分离法')

figure(2)
axes('fontsize',18,'LineWidth',6)
stairs(JFFLZhPIDu(:,1),JFFLZhPIDu(:,2),'r-');
hold on
stairs(JFFLZhPIDu(:,1),JFFLZhPIDu(:,3),'m-');
legend('积分分离法控制量','位置式PID控制算法控制量');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}控制量')

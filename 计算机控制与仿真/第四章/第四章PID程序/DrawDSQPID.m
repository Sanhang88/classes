figure(1)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDu(:,1),DSQPIDu(:,2),'r-','LineWidth',3);
hold on
plot(DSQPIDu(:,1),DSQPIDu(:,3),'k-','LineWidth',3);
legend('标准PID控制算法控制量','带死区的积分分离PID控制算法控制量');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}幅值')
title('\fontsize{18}\bf控制量比较')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDry(:,1),DSQPIDry(:,2),'r-','LineWidth',3);
hold on
plot(DSQPIDry(:,1),DSQPIDry(:,3),'k-','LineWidth',3);
plot(DSQPIDry(:,1),DSQPIDry(:,4),'b-','LineWidth',3);
legend('标准PID控制算法','带死区的积分分离PID控制算法','step');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}系统输入/输出')
title('\fontsize{18}\bf标准PID控制算法和带死区的积分分离PID控制算法输入/输出响应')

figure(1)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDtestu(:,1),DSQPIDtestu(:,3),'k-','LineWidth',3);
hold on
plot(DSQPIDtestu(:,1),DSQPIDtestu(:,2),'r-','LineWidth',3);
legend('偏差判断','控制判断');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}幅值')
title('\fontsize{18}\fontname{黑体}控制量比较')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(DSQPIDtesty(:,1),DSQPIDtesty(:,2),'r-','LineWidth',3);
hold on
plot(DSQPIDtesty(:,1),DSQPIDtesty(:,3),'k-','LineWidth',3);
legend('控制判断','偏差判断');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}系统输入/输出')
title('\fontsize{18}\fontname{黑体}控制判断与偏差判断的输入/输出响应')

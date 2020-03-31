figure(1)
axes('fontsize',18,'LineWidth',6)
stairs(BWQWFPID(:,1),BWQWFPID(:,2),'b-');
hold on
stairs(BWQWFPID(:,1),BWQWFPID(:,3),'m-');
stairs(BWQWFPID(:,1),BWQWFPID(:,4),'r-');
legend('比例项输出','积分项输出','微分项输出');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输出量')
title('\fontsize{18}\bf不完全微分输出')

figure(2)
axes('fontsize',18,'LineWidth',6)
stairs(PID(:,1),PID(:,2),'b-');
hold on
stairs(PID(:,1),PID(:,3),'m-');
stairs(PID(:,1),PID(:,4),'r-');
legend('比例项输出','积分项输出','微分项输出');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输出量')
title('\fontsize{18}\bf完全微分输出')

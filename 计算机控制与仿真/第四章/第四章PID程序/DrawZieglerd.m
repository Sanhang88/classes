figure(1)
axes('fontsize',18,'LineWidth',6)
plot(Zieglerdsine(:,1),Zieglerdsine(:,2),'b-','LineWidth',4);
hold on
plot(Zieglerdsine(:,1),Zieglerdsine(:,3),'r-','LineWidth',4);
legend('输入信号','输出信号');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输入/输出')
title('\fontsize{18}\fontname{黑体}采用数字ＰＩＤ整定后的正弦跟踪')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(Zieglerdstep(:,1),Zieglerdstep(:,2),'b-','LineWidth',4);
hold on
plot(Zieglerdstep(:,1),Zieglerdstep(:,3),'r-','LineWidth',4);
legend('输入信号','输出信号');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输入/输出')
title('\fontsize{18}\fontname{黑体}采用数字ＰＩＤ整定后的阶跃跟踪')

figure(3)
axes('fontsize',18,'LineWidth',6)
plot(Zieglerdstep1(:,1),Zieglerdstep1(:,2),'b-','LineWidth',4);
hold on
plot(Zieglerdstep1(:,1),Zieglerdstep1(:,3),'r-','LineWidth',4);
legend('输入信号','输出信号');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输入/输出')
title('\fontsize{18}\fontname{黑体}采用数字ＰＩＤ精细调整后的阶跃跟踪')

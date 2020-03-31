figure(1)
axes('fontsize',14,'LineWidth',6)
plot(StepXYQXFy(:,1),StepXYQXFy(:,2),'y-','LineWidth',2);
hold on
plot(StepXYQXFy(:,1),StepXYQXFy(:,3),'m-','LineWidth',2);
legend('阶跃响应曲线法整定后系统输出','末温70℃');
grid on
xlabel ('\fontsize{14}\bf时间T(单位:S)')
ylabel ('\fontsize{14}\fontname{黑体}系统输入/输出')
title('\fontsize{14}\bf初温为20℃，采用阶跃响应曲线法整定后的连续PID控制')

figure(2)
axes('fontsize',14,'LineWidth',6)
plot(StepXYQXF(:,1),StepXYQXF(:,2),'y-','LineWidth',2);
hold on
plot(StepXYQXF(:,1),StepXYQXF(:,3),'m-','LineWidth',2);
legend('阶跃响应曲线法未整定系统输出','末温70℃');
grid on
xlabel ('\fontsize{14}\bf时间T(单位:S)')
ylabel ('\fontsize{14}\fontname{黑体}系统输入/输出')
title('\fontsize{14}\bf采用阶跃响应曲线法未整定的连续PID控制')

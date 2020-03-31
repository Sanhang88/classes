figure(1);
axes('fontsize',18,'LineWidth',6)
plot(XGGDZhPIDu(:,1),XGGDZhPIDu(:,2),'r-','LineWidth',2);
hold on
plot(XGGDZhPIDu(:,1),XGGDZhPIDu(:,3),'k-','LineWidth',4);
legend('\fontname{黑体}\fontsize{16}修改算法的控制输出','标准PID控制算法的控制输出');
grid on
xlabel('\fontsize{14}\bf时间T(单位:S)');
ylabel('\fontsize{14}\fontname{黑体}幅值');
title('\fontsize{14}\bf修改算法中对给定值变化敏感的项和标准PID控制的控制输出');

figure(2);
axes('fontsize',18,'LineWidth',6)
plot(XGGDZhPIDry(:,1),XGGDZhPIDry(:,2),'r-','LineWidth',3);
hold on
plot(XGGDZhPIDry(:,1),XGGDZhPIDry(:,3),'k-','LineWidth',3);
grid on
xlabel('\fontsize{14}\bf时间T(单位:S)');
ylabel('\fontsize{14}\fontname{黑体}输入/输出值');
title('\fontsize{14}\bf修改算法中对给定值变化敏感的项的输入/输出');

figure(3);
axes('fontsize',18,'LineWidth',6)
plot(PID(:,1),PID(:,2),'r-','LineWidth',3);
hold on
plot(PID(:,1),PID(:,3),'k-','LineWidth',3);
grid on
xlabel('\fontsize{14}\bf时间T(单位:S)');
ylabel('\fontsize{14}\fontname{黑体}输入/输出值');
title('\fontsize{14}\bf标准PID控制算法的输入/输出');


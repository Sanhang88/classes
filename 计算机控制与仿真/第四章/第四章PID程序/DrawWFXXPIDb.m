figure(1);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDbu(:,1),WFXXPIDbu(:,2),'m-','LineWidth',2);
hold on
plot(WFXXPIDbu(:,1),WFXXPIDbu(:,3),'k-','LineWidth',3);
legend('\fontname{黑体}\fontsize{18}标准PID控制算法的控制输出','微分先行的PID控制输出');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}幅值');
title('\fontsize{18}\bf微分先行的PID控制算法与标准PID控制算法控制项');

figure(2);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDbry(:,1),WFXXPIDbry(:,2),'r-','LineWidth',4);
hold on
plot(WFXXPIDbry(:,1),WFXXPIDbry(:,3),'k-','LineWidth',4);
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}输入/输出值');
title('\fontsize{18}\bf微分先行的PID控制算法的输入/输出');

figure(3);
axes('fontsize',18,'LineWidth',6)
plot(WFXXPIDPIDby(:,1),WFXXPIDPIDby(:,2),'r-','LineWidth',3);
hold on
plot(WFXXPIDPIDby(:,1),WFXXPIDPIDby(:,3),'k-','LineWidth',3);
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}输入/输出值');
title('\fontsize{18}\bf微分先行的PID控制算法与标准PID控制算法的输入/输出');


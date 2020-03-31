figure
axes('fontsize',16,'LineWidth',3)
plot(PIDtu4_30(:,1),PIDtu4_30(:,2),'y-','LineWidth',3);
hold on
plot(PIDtu4_30(:,1),PIDtu4_30(:,3),'m-','LineWidth',3);
plot(PIDtu4_30(:,1),PIDtu4_30(:,4),'c-','LineWidth',3);
plot(PIDtu4_30(:,1),PIDtu4_30(:,5),'r-','LineWidth',3);
legend('kp=1','kp=1,ki=1.05','kp=1,ki=0.332,kd=0.33','step');
grid on
xlabel ('\fontsize{16}\bf时间T(单位:S)')
ylabel ('\fontsize{16}\fontname{黑体}系统输入/输出')
title('\fontsize{16}\fontname{黑体}积分时间与超调量的关系')

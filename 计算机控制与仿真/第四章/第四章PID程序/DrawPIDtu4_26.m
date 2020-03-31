figure
axes('fontsize',16,'LineWidth',2)
plot(PIDtu4_26(:,1),PIDtu4_26(:,2),'r-','LineWidth',3);
hold on
plot(PIDtu4_26(:,1),PIDtu4_26(:,3),'m-','LineWidth',3);
plot(PIDtu4_26(:,1),PIDtu4_26(:,4),'b-','LineWidth',3);
legend('step,','kp=10,ki=10,','kp=10,ki=50');
grid on
xlabel ('\fontsize{16}\bf时间T(单位:S)')
ylabel ('\fontsize{16}\fontname{黑体}系统输入/输出')
title('\fontsize{16}\fontname{黑体}积分时间与超调量的关系')

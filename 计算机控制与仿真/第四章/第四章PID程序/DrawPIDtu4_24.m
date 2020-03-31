figure
axes('fontsize',16,'LineWidth',3)
plot(PIDTu4_24(:,1),PIDTu4_24(:,2),'y-','LineWidth',3);
hold on
plot(PIDTu4_24(:,1),PIDTu4_24(:,3),'m-','LineWidth',3);
plot(PIDTu4_24(:,1),PIDTu4_24(:,4),'c-','LineWidth',3);
legend('step,','kp=10,','kp=10,ki=10');
grid on
xlabel ('\fontsize{16}\bf时间T(单位:S)')
ylabel ('\fontsize{16}\fontname{黑体}系统输入/输出')
title('\fontsize{16}\fontname{黑体}比例控制、比例积分控制的特点')

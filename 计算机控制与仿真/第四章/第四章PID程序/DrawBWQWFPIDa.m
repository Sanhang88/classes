subplot(211);
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,2),'r-');
hold on
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,4),'m-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}输入/输出');
title('\fontsize{18}\fontname{黑体}不完全微分位置式PID控制输出');
subplot(212);
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,3),'r-');
hold on
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,4),'m-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}输入/输出');
title('\fontsize{18}\fontname{黑体}标准位置式PID控制输出');

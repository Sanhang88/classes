figure(1)
subplot(211);
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,2),'r-');
hold on
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,4),'m-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}输入/输出');
title('\fontsize{18}\fontname{黑体}不完全微分位置式PID输出');
subplot(212);
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,3),'r-');
hold on
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,4),'b-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}输入/输出');
title('\fontsize{18}\fontname{黑体}标准位置式PID输出');

figure(2)
subplot(211);
stairs(BWQWFPIDbud1(:,1),BWQWFPIDbud1(:,2),'r-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}控制项');
title('\fontsize{18}\bf不完全微分位置式PID控制项输出');
subplot(212);
stairs(BWQWFPIDbud1(:,1),BWQWFPIDbud1(:,3),'b-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}控制项');
title('\fontsize{18}\fontname{黑体}标准位置式PID控制项输出');

figure(3)
subplot(211);
stairs(BWQWFPIDbe(:,1),BWQWFPIDbe(:,2),'r-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}偏差项');
title('\fontsize{18}\bf不完全微分位置式PID偏差项输出');
subplot(212);
stairs(BWQWFPIDbe(:,1),BWQWFPIDbe(:,3),'b-');
grid on
xlabel('\fontsize{18}\bf时间T(单位:S)');
ylabel('\fontsize{18}\fontname{黑体}偏差项');
title('\fontsize{18}\fontname{黑体}标准位置式PID偏差项输出');
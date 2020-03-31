figure
axes('fontsize',18,'LineWidth',6)
plot(JFBH(:,1),JFBH(:,2),JFBH(:,1),JFBH(:,3),JFBH(:,1),JFBH(:,4),JFBH(:,1),JFBH(:,5),JFBH(:,1),JFBH(:,6),JFBH(:,1),JFBH(:,7),'LineWidth',4);
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}输出量/控制量')
title('\fontsize{18}\fontname{黑体}积分饱和现象')

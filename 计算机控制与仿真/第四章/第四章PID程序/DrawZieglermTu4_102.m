figure(1)
axes('fontsize',18,'LineWidth',6)
plot(ZieglermTu4_102(:,1),ZieglermTu4_102(:,2),'r-','LineWidth',3);
hold on
plot(ZieglermTu4_102(:,1),ZieglermTu4_102(:,3),'k-','LineWidth',3);
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}幅值')
title('\fontsize{18}\bf临界震荡')

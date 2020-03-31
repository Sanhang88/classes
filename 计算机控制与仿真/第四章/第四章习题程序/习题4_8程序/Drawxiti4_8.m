figure(1)
axes('fontsize',18,'LineWidth',6)
plot(xiti4_81(:,1),xiti4_81(:,2),'b-','LineWidth',4);
hold on
plot(xiti4_81(:,1),xiti4_81(:,3),'k-.','LineWidth',6);
plot(xiti4_81(:,1),xiti4_81(:,4),'r-','LineWidth',3);
legend('\fontsize{18}\fontname{黑体}step','\fontsize{18}\fontname{黑体}惯性环节','\fontsize{18}\fontname{黑体}简化的惯性环节');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}幅值')
title('\fontsize{18}\fontname{黑体}阶跃响应比较')


figure(2)
axes('fontsize',18,'LineWidth',6)
plot(xiti4_82(:,1),xiti4_82(:,2),'b-','LineWidth',4);
hold on
plot(xiti4_82(:,1),xiti4_82(:,3),'k-.','LineWidth',6);
plot(xiti4_82(:,1),xiti4_82(:,4),'r-','LineWidth',3);
legend('\fontsize{18}\fontname{黑体}step','\fontsize{18}\fontname{黑体}惯性环节','\fontsize{18}\fontname{黑体}合并的惯性环节');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}幅值')
title('\fontsize{18}\fontname{黑体}阶跃响应比较')


figure(3)
axes('fontsize',18,'LineWidth',6)
plot(xiti4_83(:,1),xiti4_83(:,2),'b-','LineWidth',4);
hold on
plot(xiti4_83(:,1),xiti4_83(:,3),'k-.','LineWidth',6);
plot(xiti4_83(:,1),xiti4_83(:,4),'r-','LineWidth',3);
legend('\fontsize{18}\fontname{黑体}step','\fontsize{18}\fontname{黑体}惯性环节','\fontsize{18}\fontname{黑体}处理的惯性环节');
grid on
xlabel ('\fontsize{18}\bf时间T(单位:S)')
ylabel ('\fontsize{18}\fontname{黑体}幅值')
title('\fontsize{18}\fontname{黑体}阶跃响应比较')

figure
axes('fontsize',16,'LineWidth',6)
plot(yyy(:,1),yyy(:,2),'r--','LineWidth',4);
hold on
plot(yyy(:,1),yyy(:,3),'k-','LineWidth',4);
grid on
legend('\fontsize{18}\fontname{����}����ϵͳ','\fontsize{18}\fontname{����}���������ϵͳ');
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}����ϵͳ/���������ϵͳ���')
title('\fontsize{18}\fontname{����}����ϵͳ����������ϵͳ�����ʱ��ı仯')

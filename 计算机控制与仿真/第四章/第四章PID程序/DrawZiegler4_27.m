figure(1)
axes('fontsize',18,'LineWidth',6)
plot(Ziegler(:,1),Ziegler(:,2),'r-','LineWidth',4);
hold on
plot(Ziegler(:,1),Ziegler(:,3),'b-','LineWidth',4);
legend('step','��Ծ��Ӧ');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}����/���')
title('\fontsize{18}\bf�ٽ�����ȷ�')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(ZieglerPID(:,1),ZieglerPID(:,2),'r-','LineWidth',4);
hold on
plot(ZieglerPID(:,1),ZieglerPID(:,3),'b-','LineWidth',4);
legend('step','��Ծ��Ӧ');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}����/���')
title('\fontsize{18}\bf��ϸ������')

figure(1)
axes('fontsize',18,'LineWidth',6)
plot(Zieglerdsine(:,1),Zieglerdsine(:,2),'b-','LineWidth',4);
hold on
plot(Zieglerdsine(:,1),Zieglerdsine(:,3),'r-','LineWidth',4);
legend('�����ź�','����ź�');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}����/���')
title('\fontsize{18}\fontname{����}�������֣Уɣ�����������Ҹ���')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(Zieglerdstep(:,1),Zieglerdstep(:,2),'b-','LineWidth',4);
hold on
plot(Zieglerdstep(:,1),Zieglerdstep(:,3),'r-','LineWidth',4);
legend('�����ź�','����ź�');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}����/���')
title('\fontsize{18}\fontname{����}�������֣Уɣ�������Ľ�Ծ����')

figure(3)
axes('fontsize',18,'LineWidth',6)
plot(Zieglerdstep1(:,1),Zieglerdstep1(:,2),'b-','LineWidth',4);
hold on
plot(Zieglerdstep1(:,1),Zieglerdstep1(:,3),'r-','LineWidth',4);
legend('�����ź�','����ź�');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}����/���')
title('\fontsize{18}\fontname{����}�������֣Уɣľ�ϸ������Ľ�Ծ����')

figure(1)
axes('fontsize',18,'LineWidth',6)
plot(YXXRJFPIDI(:,1),YXXRJFPIDI(:,2),'y-','LineWidth',3);
hold on
plot(YXXRJFPIDI(:,1),YXXRJFPIDI(:,3),'m-','LineWidth',3);
legend('�����������ַ�������','λ��ʽPID�����㷨������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}������')
title('\fontsize{18}\bf������Ƚ�')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(YXXRJFPID(:,1),YXXRJFPID(:,2),'c-','LineWidth',3);
hold on
plot(YXXRJFPID(:,1),YXXRJFPID(:,3),'y-','LineWidth',3);
plot(YXXRJFPID(:,1),YXXRJFPID(:,4),'m-','LineWidth',3);
legend('step','�����������ַ�','λ��ʽPID�����㷨');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}ϵͳ����/���')
title('\fontsize{18}\bf������������PID�����㷨')

figure(3)
axes('fontsize',18,'LineWidth',6)
plot(YXXRJFPIDu(:,1),YXXRJFPIDu(:,2),'y-','LineWidth',3);
hold on
plot(YXXRJFPIDu(:,1),YXXRJFPIDu(:,3),'m-','LineWidth',3);
legend('�����������ַ�������','λ��ʽPID�����㷨������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}������')
title('\fontsize{18}\bf������Ƚ�')
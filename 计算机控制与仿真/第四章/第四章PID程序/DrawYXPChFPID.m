figure(1)
axes('fontsize',18,'LineWidth',6)
plot(YXPChFPIDI(:,1),YXPChFPIDI(:,2),'b-','LineWidth',3);
hold on
plot(YXPChFPIDI(:,1),YXPChFPIDI(:,3),'m-','LineWidth',3);
legend('��Чƫ�������','λ��ʽPID�����㷨������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}������')
title('\fontsize{18}\bf��Чƫ���λ��ʽPID�����㷨������Ƚ�')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(YXPChFPIDu(:,1),YXPChFPIDu(:,2),'b-','LineWidth',3);
hold on
plot(YXPChFPIDu(:,1),YXPChFPIDu(:,3),'m-','LineWidth',3);
legend('��Чƫ�������','λ��ʽPID�����㷨������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}������')
title('\fontsize{18}\bf��Чƫ���λ��ʽPID�����㷨������Ƚ�')

figure(3)
axes('fontsize',18,'LineWidth',6)
plot(YXPChFPIDy(:,1),YXPChFPIDy(:,2),'b-','LineWidth',3);
hold on
plot(YXPChFPIDy(:,1),YXPChFPIDy(:,3),'m-','LineWidth',3);
plot(YXPChFPIDy(:,1),YXPChFPIDy(:,4),'r-','LineWidth',3);
legend('step','��Чƫ�','λ��ʽPID�����㷨');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}ϵͳ����/���')
title('\fontsize{18}\bf��Чƫ���λ��ʽPID�����㷨����/����Ƚ�')

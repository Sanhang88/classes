figure
axes('fontsize',16,'LineWidth',6)
plot(ZLShPID(:,1),ZLShPID(:,2),'y-','LineWidth',3);
hold on
plot(ZLShPID(:,1),ZLShPID(:,3),'m-','LineWidth',3);
legend('�����ź�','����ź�');
grid on
xlabel ('\fontsize{16}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{16}\fontname{����}ϵͳ����/���')
title('\fontsize{16}\bfλ��ʽPID���ƽ�Ծ��Ӧ')


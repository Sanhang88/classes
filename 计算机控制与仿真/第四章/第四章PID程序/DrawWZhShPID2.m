figure
axes('fontsize',16,'LineWidth',6)
plot(WZhShPID2(:,1),WZhShPID2(:,2),'y-','LineWidth',3);
hold on
plot(WZhShPID2(:,1),WZhShPID2(:,3),'m-','LineWidth',3);
legend('�����ź�','����ź�');
grid on
xlabel ('\fontsize{16}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{16}\fontname{����}ϵͳ����/���')
title('\fontsize{16}\bfλ��ʽPID����������Ӧ')


figure(1)
axes('fontsize',18,'LineWidth',6)
stairs(JFFLZhPID(:,1),JFFLZhPID(:,2),'r-');
hold on
stairs(JFFLZhPID(:,1),JFFLZhPID(:,3),'m-');
stairs(JFFLZhPID(:,1),JFFLZhPID(:,4),'b-');
legend('step','λ��ʽPID�����㷨','���ַ��뷨');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}����/���')
title('\fontsize{18}\bf���ַ��뷨')

figure(2)
axes('fontsize',18,'LineWidth',6)
stairs(JFFLZhPIDu(:,1),JFFLZhPIDu(:,2),'r-');
hold on
stairs(JFFLZhPIDu(:,1),JFFLZhPIDu(:,3),'m-');
legend('���ַ��뷨������','λ��ʽPID�����㷨������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}������')

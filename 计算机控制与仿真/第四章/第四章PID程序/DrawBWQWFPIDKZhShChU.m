figure(1)
axes('fontsize',18,'LineWidth',6)
stairs(BWQWFPID(:,1),BWQWFPID(:,2),'b-');
hold on
stairs(BWQWFPID(:,1),BWQWFPID(:,3),'m-');
stairs(BWQWFPID(:,1),BWQWFPID(:,4),'r-');
legend('���������','���������','΢�������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}�����')
title('\fontsize{18}\bf����ȫ΢�����')

figure(2)
axes('fontsize',18,'LineWidth',6)
stairs(PID(:,1),PID(:,2),'b-');
hold on
stairs(PID(:,1),PID(:,3),'m-');
stairs(PID(:,1),PID(:,4),'r-');
legend('���������','���������','΢�������');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}�����')
title('\fontsize{18}\bf��ȫ΢�����')

figure
axes('fontsize',16,'LineWidth',2)
plot(PIDtu4_26(:,1),PIDtu4_26(:,2),'r-','LineWidth',3);
hold on
plot(PIDtu4_26(:,1),PIDtu4_26(:,3),'m-','LineWidth',3);
plot(PIDtu4_26(:,1),PIDtu4_26(:,4),'b-','LineWidth',3);
legend('step,','kp=10,ki=10,','kp=10,ki=50');
grid on
xlabel ('\fontsize{16}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{16}\fontname{����}ϵͳ����/���')
title('\fontsize{16}\fontname{����}����ʱ���볬�����Ĺ�ϵ')

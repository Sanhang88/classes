figure
axes('fontsize',16,'LineWidth',3)
plot(PIDTu4_24(:,1),PIDTu4_24(:,2),'y-','LineWidth',3);
hold on
plot(PIDTu4_24(:,1),PIDTu4_24(:,3),'m-','LineWidth',3);
plot(PIDTu4_24(:,1),PIDTu4_24(:,4),'c-','LineWidth',3);
legend('step,','kp=10,','kp=10,ki=10');
grid on
xlabel ('\fontsize{16}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{16}\fontname{����}ϵͳ����/���')
title('\fontsize{16}\fontname{����}�������ơ��������ֿ��Ƶ��ص�')

figure
axes('fontsize',16,'LineWidth',6)
plot(PIDtu4_28(:,1),PIDtu4_28(:,2),'y-','LineWidth',3);
hold on
plot(PIDtu4_28(:,1),PIDtu4_28(:,3),'m-','LineWidth',3);
legend('step','kp=1,ki=0.3,kd=0.5');
grid on
xlabel ('\fontsize{16}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{16}\fontname{����}ϵͳ����/���')
title('\fontsize{16}\fontname{����}��������΢�ֿ��ƵĽ�Ծ��Ӧ')


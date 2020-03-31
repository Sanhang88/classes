figure(1)
axes('fontsize',18,'LineWidth',6)
plot(PIDtu_34(:,1),PIDtu_34(:,2),'y-','LineWidth',3);
hold on
plot(PIDtu_34(:,1),PIDtu_34(:,5),'r-','LineWidth',3);
legend('kp=1','step');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}ϵͳ����/���')
title('\fontsize{18}\bf�������Ƶ�λ��Ծ��Ӧ')

figure(2)
axes('fontsize',18,'LineWidth',6)
plot(PIDtu_34(:,1),PIDtu_34(:,3),'y-','LineWidth',3);
hold on
plot(PIDtu_34(:,1),PIDtu_34(:,5),'r-','LineWidth',3);
legend('kp=1,ki=1.05','step');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}ϵͳ����/���')
title('\fontsize{18}\bf�������ֿ��Ƶ�λ��Ծ��Ӧ')


figure(3)
axes('fontsize',18,'LineWidth',6)
plot(PIDtu_34(:,1),PIDtu_34(:,2),'y-','LineWidth',3);
hold on
plot(PIDtu_34(:,1),PIDtu_34(:,3),'m-','LineWidth',3);
plot(PIDtu_34(:,1),PIDtu_34(:,4),'c-','LineWidth',3);
plot(PIDtu_34(:,1),PIDtu_34(:,5),'r-','LineWidth',3);
legend('kp=1','kp=1,ki=1.05','kp=1,ki=0.712,kd=0.3068','step');
grid on
xlabel ('\fontsize{18}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{18}\fontname{����}ϵͳ����/���')
title('\fontsize{18}\bfkp��ki��kdȡ��ֵͬʱ�Ľ�Ծ��Ӧ')

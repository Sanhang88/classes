figure(1)
axes('fontsize',14,'LineWidth',6)
plot(StepXYQXFy(:,1),StepXYQXFy(:,2),'y-','LineWidth',2);
hold on
plot(StepXYQXFy(:,1),StepXYQXFy(:,3),'m-','LineWidth',2);
legend('��Ծ��Ӧ���߷�������ϵͳ���','ĩ��70��');
grid on
xlabel ('\fontsize{14}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{14}\fontname{����}ϵͳ����/���')
title('\fontsize{14}\bf����Ϊ20�棬���ý�Ծ��Ӧ���߷������������PID����')

figure(2)
axes('fontsize',14,'LineWidth',6)
plot(StepXYQXF(:,1),StepXYQXF(:,2),'y-','LineWidth',2);
hold on
plot(StepXYQXF(:,1),StepXYQXF(:,3),'m-','LineWidth',2);
legend('��Ծ��Ӧ���߷�δ����ϵͳ���','ĩ��70��');
grid on
xlabel ('\fontsize{14}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{14}\fontname{����}ϵͳ����/���')
title('\fontsize{14}\bf���ý�Ծ��Ӧ���߷�δ����������PID����')

figure
axes('fontsize',16,'LineWidth',6)
plot(PIDtu4_20(:,1),PIDtu4_20(:,2));
hold on
plot(PIDtu4_20(:,1),PIDtu4_20(:,3),'m--','LineWidth',3);
plot(PIDtu4_20(:,1),PIDtu4_20(:,4),'c-.','LineWidth',3);
plot(PIDtu4_20(:,1),PIDtu4_20(:,5),'r:','LineWidth',3);
legend('step','kp=2','kp=10','kp=50');
grid on
xlabel ('\fontsize{16}\bfʱ��T(��λ:S)')
ylabel ('\fontsize{16}\fontname{����}ϵͳ���')
title('\fontsize{16}\bf��ͬkpֵ�Ե�λ��Ծ����Ӧ')


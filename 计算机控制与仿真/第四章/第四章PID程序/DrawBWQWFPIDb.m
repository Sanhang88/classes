figure(1)
subplot(211);
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,2),'r-');
hold on
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,4),'m-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���');
title('\fontsize{18}\fontname{����}����ȫ΢��λ��ʽPID���');
subplot(212);
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,3),'r-');
hold on
stairs(BWQWFPIDbry(:,1),BWQWFPIDbry(:,4),'b-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���');
title('\fontsize{18}\fontname{����}��׼λ��ʽPID���');

figure(2)
subplot(211);
stairs(BWQWFPIDbud1(:,1),BWQWFPIDbud1(:,2),'r-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}������');
title('\fontsize{18}\bf����ȫ΢��λ��ʽPID���������');
subplot(212);
stairs(BWQWFPIDbud1(:,1),BWQWFPIDbud1(:,3),'b-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}������');
title('\fontsize{18}\fontname{����}��׼λ��ʽPID���������');

figure(3)
subplot(211);
stairs(BWQWFPIDbe(:,1),BWQWFPIDbe(:,2),'r-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}ƫ����');
title('\fontsize{18}\bf����ȫ΢��λ��ʽPIDƫ�������');
subplot(212);
stairs(BWQWFPIDbe(:,1),BWQWFPIDbe(:,3),'b-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}ƫ����');
title('\fontsize{18}\fontname{����}��׼λ��ʽPIDƫ�������');
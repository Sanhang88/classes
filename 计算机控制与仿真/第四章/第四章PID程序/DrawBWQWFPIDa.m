subplot(211);
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,2),'r-');
hold on
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,4),'m-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���');
title('\fontsize{18}\fontname{����}����ȫ΢��λ��ʽPID�������');
subplot(212);
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,3),'r-');
hold on
stairs(BWQWFPIDary(:,1),BWQWFPIDary(:,4),'m-');
grid on
xlabel('\fontsize{18}\bfʱ��T(��λ:S)');
ylabel('\fontsize{18}\fontname{����}����/���');
title('\fontsize{18}\fontname{����}��׼λ��ʽPID�������');

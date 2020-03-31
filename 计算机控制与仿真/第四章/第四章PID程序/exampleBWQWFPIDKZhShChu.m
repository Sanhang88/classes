%不完全微分的PID位置式控制算法b控制量输出
clear all;close all;
ts=20;
udb_1=0;ud_1=0;
e_1=0;ei=0;
for k=0:1:10
    time(k+1)=k*ts;
    r(k+1)=1;
    e(k+1)=r(k+1);
    ei=ei+e(k+1)*ts;
    kp=0.30;ki=0.0055; kd=42;
    Tf=180;    %低通滤波器
    alfa=Tf/(ts+Tf);
    up(k+1)=kp*e(k+1);
    uI(k+1)=ki*ei;
    udb(k+1)=alfa*udb_1+kd*(1-alfa)*(e(k+1)-e_1)/ts;  %采用不完全微分的PID位置式控制算法
    udb_1=udb(k+1);
    
    ud(k+1)=kd*(e(k+1)-e_1)/ts; %采用普通PID位置式控制算法
    ud_1=ud(k+1);
    e_1=e(k+1);
end
figure(1)
axes('fontsize',18,'LineWidth',6)
stairs(time,udb,'r-');grid on;xlabel('\fontsize{18}\bf时间T(单位:S)');ylabel('\fontsize{18}\fontname{黑体}控制量');title('\fontsize{18}\bf不完全微分位置式PID控制微分项输出');

figure(2)
axes('fontsize',18,'LineWidth',6)
stairs(time,ud,'r');grid on;xlabel('\fontsize{14}\bf时间T(单位:S)');ylabel('\fontsize{18}\fontname{黑体}控制量');title('\fontsize{18}\bf标准位置式PID控制微分项输出');

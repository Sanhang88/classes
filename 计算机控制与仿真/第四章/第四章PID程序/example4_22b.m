%不完全微分的PID位置式控制算法b example4_22b
clear all;close all;
ts=20;
sys=tf([1],[70,1],'inputdelay',80);
dsys=c2d(sys,ts,'zoh');
[num,den]=tfdata(dsys,'v');
u_1=0;u_2=0;u_3=0;u_4=0;u_5=0;ud_1=0;
y_1=0;y_2=0;y_3=0;
e_1=0;ei=0;
for k=0:1:50
    time(k+1)=k*ts;
    r(k+1)=1;
    y(k+1)=-den(2)*y_1+num(2)*u_4;
    D(k+1)=0.01*rands(1);
    y(k+1)=y(k+1)+D(k+1);
    e(k+1)=r(k+1)-y(k+1);
    ei=ei+e(k+1)*ts;
    kp=0.30;ki=0.005; kd=42;
    Tf=380; Df=tf([1],[Tf,1]);   %低通滤波器
    M=1;
    if M==1      %采用不完全微分的PID位置式控制算法
        alfa=Tf/(ts+Tf);
        ud(k+1)=alfa*ud_1+kd*(1-alfa)*(e(k+1)-e_1)/ts;
    	u(k+1)=kp*e(k+1)+ki*ei+ud(k+1);
        ud_1=ud(k+1);
    elseif M==2  %采用普通PID位置式控制算法 
        u(k+1)=kp*e(k+1)+ki*ei+kd*(e(k+1)-e_1)/ts;
    end
    if u(k+1)>=10
        u(k+1)=10;
    end
    if u(k+1)<=-10
        u(k+1)=-10;
    end
    u_5=u_4;u_4=u_3;u_3=u_2;u_2=u_1;u_1=u(k+1);
    y_3=y_2;y_2=y_1;y_1=y(k+1);
    e_1=e(k+1);
end
subplot(311);
stairs(time,r,'b','LineWidth',2);
hold on
stairs(time,y,'r','LineWidth',2);
xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}输入/输出');
if M==1
    title('\fontsize{14}\fontname{黑体}采用不完全微分的PID位置式控制算法')
elseif M==2
    title('\fontsize{14}\fontname{黑体}采用标准PID位置式控制算法')
end
subplot(312);
stairs(time,u,'r','LineWidth',2);
xlabel('\fontsize{14}\bf时间（单位:s）');ylabel('\fontsize{14}\fontname{黑体}控制量');
subplot(313);
stairs(time,r-y,'r','LineWidth',2);
xlabel('\fontsize{14}\bf时间（单位:s）');ylabel('\fontsize{14}\fontname{黑体}偏差');




%不完全微分的PID位置式控制算法4_22a
clear all;
close all;

ts=20;
sys=tf([1],[60,1],'inputdelay',80);
dsys=c2d(sys,ts,'zoh');
[num,den]=tfdata(dsys,'v');

u_1=0;u_2=0;u_3=0;u_4=0;u_5=0;
ud_1=0;
y_1=0;y_2=0;y_3=0;
e_1=0;ei=0;

for k=0:1:50
    time(k+1)=k*ts;
    r(k+1)=1.0;
    %Linear model
    y(k+1)=-den(2)*y_1+num(2)*u_4;
    D(k+1)=0.01*rands(1);
    y(k+1)=y(k+1)+D(k+1);
    e(k+1)=r(k+1)-y(k+1);
    
    Tf=180;
    Q=tf([1],[Tf,1]);   %Low Freq Signal Filter
    
    alfa=Tf/(ts+Tf);
    %PID Controller with partly differential
    ei=ei+(1-alfa)*e(k+1)*ts;
    kp=0.9;
    ki=0.0043;
    kd=42;
    
    M=1;
    if M==1      %采用不完全微分的PID位置式控制算法2
        ud(k+1)=kd*(1-alfa)*(e(k+1)-e_1)/ts;
        u(k+1)=alfa*u_1+kp*(1-alfa)*e(k+1)+ud(k+1)+ki*ei;
    elseif M==2  %采用普通PID位置式控制算法
        u(k+1)=kc*e(k+1)+kd*(e(k+1)-e_1)/ts+ki*ei;
    end
    %Restricting the output of controller
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
subplot(312);
stairs(time,u,'r','LineWidth',2);
xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}控制量');
subplot(313);
stairs(time,r-y,'r','LineWidth',2);
xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}偏差');

%积分分离PID控制算法example 4_18
clear all;close all;
ts=20;
sys=tf([1],[70,1],'inputdelay',80);
dsys=c2d(sys,ts,'zoh');
[num,den]=tfdata(dsys,'v');
u_1=0;u_2=0;u_3=0;u_4=0;u_5=0;
y_1=0;y_2=0;y_3=0;
e_1=0;e_2=0;ei=0;

for k=0:1:60
    time(k+1)=k*ts;
    y(k+1)=-den(2)*y_1+num(2)*u_4;
    r(k+1)=1;
    e(k+1)=r(k+1)-y(k+1);
    ei=ei+e(k+1)*ts;
    M=1;
    if M==1            %积分分离法
        if abs(e(k+1))>0.7
            beat=0;
        else
            beat=1;
        end
    elseif M==2        %普通PID控制算法
        beat=1;   
    end
    kp=1;ki=0.007;kd=15;
    u(k+1)=kp*e(k+1)+kd*(e(k+1)-e_1)/ts+beat*ki*ei;
    if u(k+1)>=10       
       u(k+1)=10;
    end
    if u(k+1)<=-10
       u(k+1)=-10;
    end
    u_5=u_4;u_4=u_3;u_3=u_2;u_2=u_1;u_1=u(k+1);   
    y_3=y_2;y_2=y_1;y_1=y(k+1);
    e_2=e_1;e_1=e(k+1);
end
subplot(211);
stairs(time,r,'b','LineWidth',2);
hold on
stairs(time,y,'r','LineWidth',2);xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}输入/输出');
subplot(212);
stairs(time,u,'r','LineWidth',2);xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}控制量');
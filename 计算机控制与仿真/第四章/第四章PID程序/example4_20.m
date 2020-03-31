%有效偏差法PID控制算法example4_20
clear all;close all;
ts=0.001;
sys=tf(285689,[1,80,8400,0]);
dsys=c2d(sys,ts,'z');
[num,den]=tfdata(dsys,'v');
u_1=0;u_2=0;u_3=0;
y_1=0;y_2=0;y_3=0;
x(1)=0;x(2)=0;x(3)=0;
e_1=0;
um=10;
kp=0.8;ki=9;kd=0.0;   
for k=1:1:1000
    time(k)=k*ts;
    r(k)=30;           
    u(k)=kp*x(1)+ki*x(2)+kd*x(3);   % PID控制
    if u(k)>=um
        u(k)=um;
    end
    if u(k)<=-um
        u(k)=-um;
    end
    y(k)=num(2)*u_1+num(3)*u_2+num(4)*u_3-den(2)*y_1-den(3)*y_2-den(4)*y_3;
    M=1;
    if M==1                       %有效偏差法
        if u(k)==um|u(k)==-um
            ei(k)=(u(k)-ki*x(2)+kd*e_1/ts)/(kp+ki*ts+kd/ts);
            e(k)=r(k)-y(k); 
            x(1)=e(k);               % 计算比例项
            x(2)=x(2)+ei(k)*ts;       % 计算积分项
            x(3)=(e(k)-e_1)/ts;      % 计算微分项
            xi(k)=ki*x(2);
        else
            e(k)=r(k)-y(k); 
            x(1)=e(k);               % 计算比例项
            x(2)=x(2)+e(k)*ts;       % 计算积分项
            x(3)=(e(k)-e_1)/ts;      % 计算微分项
            xi(k)=ki*x(2);
        end
     
    elseif M==2                  %普通PID控制算法
        e(k)=r(k)-y(k);    
        x(1)=e(k);               % 计算比例项
        x(2)=x(2)+e(k)*ts;       % 计算积分项
        x(3)=(e(k)-e_1)/ts;      % 计算微分项
        xi(k)=ki*x(2);
    end
    
    %Return of PID parameters
    u_3=u_2;u_2=u_1;u_1=u(k);   
    y_3=y_2;y_2=y_1;y_1=y(k);
    e_1=e(k);
    
%     x(1)=e(k);               % 计算比例项
%     x(2)=x(2)+e(k)*ts;       % 计算积分项
%     x(3)=(e(k)-e_1)/ts;      % 计算微分项
%     xi(k)=ki*x(2);
end
figure(1);
axes('fontsize',18,'LineWidth',6)
subplot(311);
plot(time,r,'b',time,y,'r','LineWidth',3);xlabel('\fontsize{18}\bf时间(单位:s)');ylabel('\fontsize{18}\fontname{黑体}输入/输出');
subplot(312);
plot(time,u,'r','LineWidth',3);xlabel('\fontsize{18}\bf时间(单位:s)');ylabel('\fontsize{18}\fontname{黑体}控制量u');
subplot(313);
plot(time,xi,'r','LineWidth',3);xlabel('\fontsize{18}\bf时间(单位:s)');ylabel('\fontsize{18}\fontname{黑体}积分项');


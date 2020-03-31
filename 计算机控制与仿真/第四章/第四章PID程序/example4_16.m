%增量式PID控制算法/example 4_16
clear all;clc;
ts=0.001;
sys=tf(400,[1,50,0]);
dsys=c2d(sys,ts,'z')
[num,den]=tfdata(dsys,'v')
u_1=0;u_2=0;u_3=0;
y_1=0;y_2=0;y_3=0;
x(1)=0;x(2)=0;x(3)=0;
e_1=0;e_2=0;
for k=1:1:1000
    time(k)=k*ts;
    r(k)=1.0;
    kp=1.9;
    ki=0.01;
    kd=0.006;
    du(k)=kp*x(1)+ki*x(2)*ts+kd*x(3)/ts;   %增量式PID控制
    u(k)=u_1+du(k);
    y(k)=num(1)*u(k)+num(2)*u_1+num(3)*u_2-den(2)*y_1-den(3)*y_2;
%     y(k)=num(2)*u_1+num(3)*u_2-den(2)*y_1-den(3)*y_2;
    e(k)=r(k)-y(k);
    u_3=u_2;u_2=u_1;u_1=u(k);
    y_3=y_2;y_2=y_1;y_1=y(k);
    x(1)=e(k)-e_1;             %计算比例项
    x(2)=e(k);                 %计算积分项
    x(3)=e(k)-2*e_1+e_2;       %计算微分项
    e_2=e_1;
    e_1=e(k);
end
plot(time,r,'b',time,y,'r','LineWidth',3);grid;
xlabel('\fontsize{18}\bf时间(单位:s)'),ylabel('\fontsize{18}\fontname{黑体}输入/输出');
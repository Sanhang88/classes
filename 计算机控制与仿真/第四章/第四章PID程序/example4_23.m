%给定值的前置滤波PID控制算法example4_23
clear all;close all;
ts=20;
sys=tf([1],[70,1],'inputdelay',80);
dsys=c2d(sys,ts,'zoh');
[num,den]=tfdata(dsys,'v');
u_1=0;u_2=0;u_3=0;u_4=0;u_5=0;ud_1=0;
y_1=0;r_1=0;rin_1=0;
e_1=0;e_2=0;ei=0;
for k=0:1:400
    time(k+1)=k*ts;
    y(k+1)=-den(2)*y_1+num(2)*u_4;
    kp=0.32;ki=0.005;kd=14;
    d(k+1)=1.0*sign(sin(0.00025*2*pi*k*ts));
    r(k+1)=d(k+1)+0.05*sin(0.03*pi*k*ts);
    sys1=tf([1],[150,1]);   %前置滤波器
    dsys1=c2d(sys1,ts,'z');
    [num1,den1]=tfdata(dsys1,'v');
    M=1;
    if M==1      %采用前置滤波PID控制算法
        rin(k+1)=-den1(2)*rin_1+num1(1)*r(k+1)+num1(2)*r_1;
    elseif M==2  %采用普通PID控制算法
        rin(k+1)=r(k+1);
    end
    e(k+1)=rin(k+1)-y(k+1);
    ei=ei+e(k+1)*ts;
    u(k+1)=kp*e(k+1)+ki*ei+kd*(e(k+1)-e_1)/ts;
    if u(k+1)>=10
        u(k+1)=10;
    end
    if u(k+1)<=-10
        u(k+1)=-10;
    end
    u_5=u_4;u_4=u_3;u_3=u_2;u_2=u_1;u_1=u(k+1); 
    y_1=y(k+1);
    r_2=r_1;r_1=r(k+1);rin_1=rin(k+1);
    e_1=e(k+1);
end
subplot(211);
plot(time,r,'r',time,y,'b','LineWidth',2);
xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}输入/输出');
subplot(212);
plot(time,r,'r',time,rin,'b','LineWidth',2);
xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}滤波前的输入信号/滤波后的输入信号');


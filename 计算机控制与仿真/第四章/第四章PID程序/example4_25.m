%微分先行的PID控制算法a example4_25
clear all;close all;
ts=20;
sys=tf([1],[70,1],'inputdelay',80);
dsys=c2d(sys,ts,'zoh');
[num,den]=tfdata(dsys,'v');
u_1=0;u_2=0;u_3=0;u_4=0;u_5=0;ud_1=0;
y_1=0;e_1=0;e_2=0;ei=0;
for k=0:1:400
    time(k+1)=k*ts;
    y(k+1)=-den(2)*y_1+num(2)*u_4;
    kp=0.3;ki=0.006;kd=18;
    r(k+1)=1.0*sign(sin(0.00025*2*pi*k*ts));
    r(k+1)=r(k+1)+0.05*sin(0.03*pi*k*ts);
    gama=0.4;
    Td=kd/kp;
    c1=gama*Td/(gama*Td+ts);
    c2=(Td+ts)/(gama*Td+ts);
    c3=Td/(gama*Td+ts);
    M=1;
    if M==1      %采用微分先行PID控制算法
        ud(k+1)=c1*ud_1+c2*y(k+1)-c3*y_1;
        ud_1=ud(k+1);
        e(k+1)=r(k+1)-ud(k+1);
        ei=ei+e(k+1)*ts;
        u(k+1)=kp*e(k+1)+ki*ei;
    elseif M==2  %采用普通PID控制算法
        e(k+1)=r(k+1)-y(k+1);
        ei=ei+e(k+1)*ts;
        u(k+1)=kp*e(k+1)+ki*ei+kd*(e(k+1)-e_1)/ts;
    end
    if u(k+1)>=10
        u(k+1)=10;
    end
    if u(k+1)<=-10
        u(k+1)=-10;
    end
    u_5=u_4;u_4=u_3;u_3=u_2;u_2=u_1;u_1=u(k+1); 
    y_1=y(k+1);e_1=e(k+1);
end
subplot(211);
plot(time,r,'r',time,y,'b','LineWidth',2);
xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}输入/输出');
subplot(212);
plot(time,u,'r','LineWidth',2);
xlabel('\fontsize{14}\bf时间(单位:s)');ylabel('\fontsize{14}\fontname{黑体}控制量');

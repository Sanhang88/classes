%��������PID�����㷨example4_26
clear all;close all;
ts=0.001;
sys=tf(285689,[1,80,8400,0]);
dsys=c2d(sys,ts,'z');
[num,den]=tfdata(dsys,'v');
u_1=0;u_2=0;u_3=0;u_4=0;u_5=0;
y_1=0;y_2=0;y_3=0;
yy_1=0;
e_1=0;e_2=0;ei=0;
sys1=tf([1],[0.1,1]);  
dsys1=c2d(sys1,ts,'tustin');
[num1,den1]=tfdata(dsys1,'v');
f_1=0;
for k=1:1:2000
    time(k)=k*ts;
    r(k)=1;
    y(k)=-den(2)*y_1-den(3)*y_2-den(4)*y_3+num(2)*u_1+...
             num(3)*u_2+num(4)*u_3;
    D(k)=0.50*rands(1);     %�����ź�
    yy(k)=y(k)+D(k);
    filty(k)=-den1(2)*f_1+num1(1)*(yy(k)+yy_1);
    e(k)=r(k)-filty(k);
    if abs(e(k))<=0.2
        ei=ei+e(k)*ts;
    else
        ei=0;
    end
    kp=0.57;ki=0.01;kd=0.05;
    u(k)=kp*e(k)+ki*ei+kd*(e(k)-e_1)/ts;
    M=1;
    if M==1     %����������PID�����㷨
        u(k)=u(k);
    elseif M==2  %��������PID�����㷨
        if abs(e(k))<=0.15
            u(k)=0;
        end
    end
    if u(k)>=10
        u(k)=10;
    end
    if u(k)<=-10
        u(k)=-10;
    end
    r_1=r(k);
    u_3=u_2;u_2=u_1;u_1=u(k);   
    y_3=y_2;y_2=y_1;y_1=y(k);
    f_1=filty(k);yy_1=yy(k);
    e_2=e_1;e_1=e(k);
end
figure(1);
subplot(211);plot(time,r,'r',time,filty,'b','LineWidth',2);xlabel('\fontsize{14}\bfʱ��(��λ:s)');ylabel('\fontsize{14}\fontname{����}����/���');
subplot(212);plot(time,u,'r','LineWidth',2);xlabel('\fontsize{14}\bfʱ��(��λ:s)');ylabel('\fontsize{14}\fontname{����}������');

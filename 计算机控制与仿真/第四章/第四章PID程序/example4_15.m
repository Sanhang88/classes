%λ��ʽPID�����㷨/example 4_15
clear all;close all;
ts=0.001;
sys=tf(523500,[1,87.35,10470,0]);
dsys=c2d(sys,ts,'z');
[num,den]=tfdata(dsys,'v')
u_1=0;u_2=0;u_3=0;
y_1=0;y_2=0;y_3=0;
x(1)=0;x(2)=0;x(3)=0;
e_1=0;
for k=1:1:1000
    time(k)=k*ts;
    Sign=1;
    if Sign==1
        kp=0.50;ki=0.001;kd=0.001;
        r(k)=1;                       %����Ϊ��Ծ�ź�
    elseif Sign==2
        kp=1.5;ki=1.0;kd=0.01;          
        r(k)=0.5*sin(2*2*pi*k*ts);   %����Ϊ�����ź�  
    end
    u(k)=kp*x(1)+ki*x(2)+kd*x(3);    %λ��ʽPID����
    y(k)=num(1)*u(k)+num(2)*u_1+num(3)*u_2+num(4)*u_3-den(2)*y_1-den(3)*y_2-den(4)*y_3;
    e(k)=r(k)-y(k);
    u_3=u_2;u_2=u_1;u_1=u(k);
    y_3=y_2;y_2=y_1;y_1=y(k);
    x(1)=e(k);                      %���������
    x(2)=x(2)+e(k)*ts;              %���������
    x(3)=(e(k)-e_1)/ts;             %����΢����
    e_1=e(k);
end
figure(1);
plot(time,r,'b',time,y,'r','LineWidth',3);
xlabel('\fontsize{18}\bfʱ��(��λ:s)'),ylabel('\fontsize{18}\fontname{����}����/���');

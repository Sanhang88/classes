%��������ɢ�����xiti4-5У�����T=0.02(������ǰУ��)
clear all;clc;
G0=tf(10,conv([1 0],[1 1]));
G=feedback(G0,1);
ts=0.02;
Gh=tf(1,[ts/2 1]);
G=G0*Gh
Dcs=tf([2.65 1],[0.01 1])                 %������ǰУ��������
sysc=G*Dcs;
sys=feedback(sysc,1);
Dcz=c2d(Dcs,ts,'tustin')
Gcz=c2d(G0,ts,'zoh');
syscz=Dcz*Gcz;
sysz=feedback(syscz,1);
figure(1);step(sys);hold on;step(sysz,1);grid on         %����ϵͳ����������ϵͳ�Ľ�Ծ��Ӧ����
figure(2);bode(sysc);grid on                             %����ϵͳ��Ƶ����Ӧ
figure(3);bode(syscz);grid on                            %���������ϵͳ��Ƶ����Ӧ


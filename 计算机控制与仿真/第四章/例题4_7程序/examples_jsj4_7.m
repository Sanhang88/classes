%��������ɢ�����
clear all;clc;
G0=tf(120,conv([1 0],[1 4]));
% G0=tf(120,conv(conv([1 0],[1 4]),[0.005 1]));
G=feedback(G0,1);
figure(1);bode(G0);grid on   %ԭϵͳ��Ƶ����Ӧ
figure(2);step(G);grid on    %ԭϵͳ�Ľ�Ծ��Ӧ����
figure(3);bode(G);grid on    %ԭ�ջ�ϵͳ�Ĵ���Ƶ�� 
ts=0.01;
Gh=tf(1,[ts/2 1]);
G=G0*Gh;
Dcs=tf([0.2 1],[0.02 1]);     %������ǰУ��������
% Dcs=tf([0.1297 0.7207],[0.02469 1]);     %��ǰ�ͺ�У��������
sysc=G*Dcs;
sys=feedback(sysc,1);
Dcz=c2d(Dcs,ts,'tustin')
Gcz=c2d(G0,ts,'zoh');
syscz=Dcz*Gcz;
sysz=feedback(syscz,1);
figure(4);step(sys);hold on;step(sysz);grid on   %����ϵͳ����������ϵͳ�Ľ�Ծ��Ӧ����
figure(5);bode(sysc);grid on    %����ϵͳ��Ƶ����Ӧ
figure(6);bode(syscz);grid on   %���������ϵͳ��Ƶ����Ӧ







%xample4_7У�����T=0.01(������ǰУ���ͳ�ǰ�ͺ�У��������)
clear all;clc;
G0=tf(120,conv([1 0],[1 4]));
ts=0.01;
Gh=tf(1,[ts/2 1]);
G=G0*Gh;
gama=55;wc=15;                   %��ǰ�ͺ�У�����������ʱ��gama,wc;
Dcs=leadlagc(G,wc,gama,30,1)     %��ǰ�ͺ�У��������

% gama=50;wc=15;                     %������ǰУ�����������ʱ��gama,wc;
% Dcs=leadczsp(3,G,[gama,wc])         %������ǰУ��������
sysc=G*Dcs;
figure(1);bode(sysc);               %����ϵͳ��Ƶ����Ӧ
sys=feedback(sysc,1);
figure(2);step(sys);                %����ϵͳ�Ľ�Ծ��Ӧ����

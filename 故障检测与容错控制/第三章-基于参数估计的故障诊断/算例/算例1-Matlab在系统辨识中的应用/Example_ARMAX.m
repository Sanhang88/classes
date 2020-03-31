%��Matlab��ϵͳ��ʶ�е�Ӧ��_����ϼ���е���������С���˷�
%��ѧģ��Ϊy(k)-1.5y(k-1)+0.705y(k-2)=0.065u(k-1)+0.084u(k-2)-0.008u(k-3)+e(k)
% -0.527e(k-1)+0.01e(K-2)
clear;
clc;
close all;

N = 10000;    %���ݳ���

%����ϵͳģ��
A = [ 1 -1.5 0.705 ];           %�����ϵ��
% B = [ 0 0.065 0.084 -0.2 ];   %������ϵ��
B = [ 0 0.065 0.084 ]; 
% C = [ 1 -0.527 0.01 ];          %�����ϵ��
C = 1;
M1 = idpoly(A,B,C);             %ARMAXģ��

%����ϵͳ��Ծ��Ӧ����
figure(1);
step(M1);
grid;
hold on;

%�������ڱ�ʶ�������������
U = iddata( [],idinput(N,'prbs') );       %α�������λʽ��������Ϊ���룬��ϵͳ��ʶ�������룺M����
E = iddata( [],idinput(N,'rgs') );        %�����˹������������Ϊ����
Y1 = sim(M1,[U,E]);                       %�������
Z = iddata(Y1,U);

%ARMAXģ�ͽ״εĹ���
NN = struc(1:2,1:4,1:4);
Loss_fun = arxstruc(Z,Z,NN);
order = selstruc(Loss_fun,'aic');
% order = [ 2,2,0,1 ];          %��Ӧarmaxģ��
% order = [2 2 1];              %��Ӧarxģ��

%ARMAXģ�Ͳ����Ĺ��ƣ���С���˷���
% Model_para = armax(Z,order);                %��������
Model_para = arx(Z,order);
present(Model_para);                        %��ʾ��ʶ���

figure(1);
step(Model_para,'r');grid;





%��ϵͳ��ʶ���ۼ�Ӧ�á�-���Կ���P59����5.3��˵�������Ϊ�������ʱ��������С��������ƫ����
%��ѧģ��Ϊy(k)+0.5y(k-1)=u(k)+n(k)+0.5n(k-1)
%��ʱ���e(k)=n(k)+0.5n(k-1),e(k+1)=n(k+1)+0.5n(k),���e(k)��e(k+1)��Ȼ���
clear;
clc;
close all;

N = 500;    %���ݳ���

%����ϵͳģ��
A = [ 1 0.5 ];               %�����ϵ��
B = 1;                       %������ϵ��
C = [1 0.5];                 %�����ϵ��
M1 = idpoly(A,B,C);          %ARMAXģ��

%����ϵͳ��Ծ��Ӧ����
figure(1);
step(M1);grid on;hold on;

%�������ڱ�ʶ�������������
U = idinput(N,'prbs') ;       %α�������λʽ��������Ϊ���룬��ϵͳ��ʶ�������룺M����
sigma = 0.2;                                %����������
E = idinput(N,'rgs')*sigma ;        %�����˹������������Ϊ����
Y1 = sim(M1,[U,E]);                       %�������
Z = iddata(Y1,U);


%ARMAXģ�Ͳ����Ĺ��ƣ�������С���˷���
order = [ 1 1 1 0 ];
Model_para = armax(Z,order);
present(Model_para);                        %��ʾ��ʶ���
% figure;
% compare(Z,Model_para);                      %��ʶ�����ʵ������Ƚ�

figure(1);
step(Model_para,'r');grid on;





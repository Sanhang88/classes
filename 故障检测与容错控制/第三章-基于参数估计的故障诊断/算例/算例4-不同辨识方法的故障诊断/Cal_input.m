%�������ڱ�ʶ�������������
clear;
clc;


N = 1023;
Ts = 0.1;
num = N/Ts;
uu= idinput(num,'prbs') ;       %α�������λʽ��������Ϊ���룬��ϵͳ��ʶ�������룺M����
% uu = [[1:num]',uu];
uu = [([1:num]*Ts)',uu];
sigma = 0.2;                                %����������
ee = idinput(num,'rgs')*sigma ;        %�����˹������������Ϊ����
ee = [([1:num]*Ts)',ee];
sim('MDL_example01');



%�������ڱ�ʶ����������
clear;
clc;
close all;

N = 1023;
uu= idinput(N,'prbs') ;       %α�������λʽ��������Ϊ���룬��ϵͳ��ʶ�������룺M����
uu = [(1:N)',uu];
sigma = 0.2;                                %����������
ee = idinput(N,'rgs')*sigma ;        %�����˹������������Ϊ����
ee = [[1:N]',ee];



%�ö�żԭ�����ȫά�۲���������
clear;
clc;

%ԭϵͳ����
A = [1 0 0;3 -1 1;0 2 0];
B = [2 1 1]';
C = [0 0 1];

%��żϵͳ����
A_couple = A';
B_couple = C';
C_couple = B';

%���żϵͳ��״̬����������K_couple
P = [-3;-4;-5]    %��������λ��

K_couple = place(A_couple,B_couple,P)
G = K_couple'

%��϶��������˻��������ԣ������浽����������
clear;
close all;
clc;

%����ģʽ�µ���Ӧ����
M_alpha = -1.94;
M_q = 0.11;
M_dlte = 1.3;
Z_alpha = 0.48;
Z_dlte = 0;
K_alpha2az = Z_alpha*177;

%����������϶�Ӧ��������Z_dlte��M_dlte�б仯�����಻��
Z_dlte_half = Z_dlte*0.75;
M_dlte_half = M_dlte*0.75;
Z_dlte_full = Z_dlte*0.5;
M_dlte_full = M_dlte*0.5;

%����ģʽ��Ӧ�Ĵ��ݺ���
tf_dlte2dtheta = -tf( [M_dlte M_dlte*Z_alpha-Z_dlte*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );

%�����������϶�Ӧ���ݺ���
tf_dlte2dtheta_half = -tf( [M_dlte_half M_dlte_half*Z_alpha-Z_dlte_half*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );

%������ȫ����϶�Ӧ���ݺ���
tf_dlte2dtheta_full = -tf( [M_dlte_full M_dlte_full*Z_alpha-Z_dlte_full*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );


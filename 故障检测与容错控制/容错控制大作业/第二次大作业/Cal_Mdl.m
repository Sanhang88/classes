%诊断对象是无人机纵向特性，升降舵到俯仰角速率
clear;
close all;
clc;

%正常模式下的相应参数
M_alpha = -1.94;
M_q = 0.11;
M_dlte = 1.3;
Z_alpha = 0.48;
Z_dlte = 0;
K_alpha2az = Z_alpha*177;

%舵面破损故障对应参数，仅Z_dlte与M_dlte有变化，其余不变
Z_dlte_half = Z_dlte*0.75;
M_dlte_half = M_dlte*0.75;
Z_dlte_full = Z_dlte*0.5;
M_dlte_full = M_dlte*0.5;

%正常模式对应的传递函数
tf_dlte2dtheta = -tf( [M_dlte M_dlte*Z_alpha-Z_dlte*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );

%升降舵半损故障对应传递函数
tf_dlte2dtheta_half = -tf( [M_dlte_half M_dlte_half*Z_alpha-Z_dlte_half*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );

%升降舵全损故障对应传递函数
tf_dlte2dtheta_full = -tf( [M_dlte_full M_dlte_full*Z_alpha-Z_dlte_full*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );


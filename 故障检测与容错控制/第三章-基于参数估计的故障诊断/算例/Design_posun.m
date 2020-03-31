%舵面破损故障的纵向增稳回路设计
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
tf_dtheta2az = tf( K_alpha2az*[Z_dlte M_dlte+Z_dlte*M_q],[M_dlte M_dlte*Z_alpha-Z_dlte*M_alpha] );

%升降舵半损故障对应传递函数
tf_dlte2dtheta_half = -tf( [M_dlte_half M_dlte_half*Z_alpha-Z_dlte_half*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );
tf_dtheta2az_half = tf( K_alpha2az*[Z_dlte_half M_dlte_half+Z_dlte_half*M_q],[M_dlte_half M_dlte_half*Z_alpha-Z_dlte_half*M_alpha] );

%升降舵全损故障对应传递函数
tf_dlte2dtheta_full = -tf( [M_dlte_full M_dlte_full*Z_alpha-Z_dlte_full*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );
tf_dtheta2az_full = tf( K_alpha2az*[Z_dlte_full M_dlte_full+Z_dlte_full*M_q],[M_dlte_full M_dlte_full*Z_alpha-Z_dlte_full*M_alpha] );

%一级品质与二级品质
kesi1_min = 0.7;
kesi2_min = 0.6;
wn1_min = 1.8;
wn1_max = 2.6;
wn2_min = 0.73;
wn2_max = 1.13;

%计算一级品质对应的参数空间
jj = 0;
for ii_kesi1 = kesi1_min:0.1:1
    for ii_wn1 = wn1_min:0.1:wn1_max
        jj = jj+1;
        array_kq(jj) = ( Z_alpha + M_q - 2*ii_kesi1*ii_wn1 )/M_dlte;
        array_kaz(jj) = ( M_alpha+Z_alpha*M_q-M_dlte*Z_alpha*array_kq(jj) - ii_wn1^2 )/( M_dlte*K_alpha2az );
        array_kq_half(jj) = ( Z_alpha + M_q - 2*ii_kesi1*ii_wn1 )/M_dlte_half;
        array_kaz_half(jj) = ( M_alpha+Z_alpha*M_q-M_dlte_half*Z_alpha*array_kq_half(jj) - ii_wn1^2 )/( M_dlte_half*K_alpha2az );
        array_kq_full(jj) = ( Z_alpha + M_q - 2*ii_kesi1*ii_wn1 )/M_dlte_full;
        array_kaz_full(jj) = ( M_alpha+Z_alpha*M_q-M_dlte_full*Z_alpha*array_kq_full(jj) - ii_wn1^2 )/( M_dlte_full*K_alpha2az );
    end
end

%绘制一级品质对应的参数空间图
figure;
plot(array_kaz,array_kq,'r*');
hold on;
plot(array_kaz_half,array_kq_half,'o');
hold on;
plot(array_kaz_full,array_kq_full,'kp');
grid on;
xlabel('kaz');
ylabel('kq');
title('一级品质');

%计算二级品质对应的参数空间
jj = 0;
for ii_kesi2 = kesi2_min:0.1:1
    for ii_wn2 = wn2_min:0.1:wn2_max
        jj = jj+1;
        array_kq2(jj) = ( Z_alpha + M_q - 2*ii_kesi2*ii_wn2 )/M_dlte;
        array_kaz2(jj) = ( M_alpha+Z_alpha*M_q-M_dlte*Z_alpha*array_kq2(jj) - ii_wn2^2 )/( M_dlte*K_alpha2az );
        array_kq2_half(jj) = ( Z_alpha + M_q - 2*ii_kesi2*ii_wn2 )/M_dlte_half;
        array_kaz2_half(jj) = ( M_alpha+Z_alpha*M_q-M_dlte_half*Z_alpha*array_kq2_half(jj) - ii_wn2^2 )/( M_dlte_half*K_alpha2az );
        array_kq2_full(jj) = ( Z_alpha + M_q - 2*ii_kesi2*ii_wn2 )/M_dlte_full;
        array_kaz2_full(jj) = ( M_alpha+Z_alpha*M_q-M_dlte_full*Z_alpha*array_kq2_full(jj) - ii_wn2^2 )/( M_dlte_full*K_alpha2az );
    end
end

%绘制二级品质对应的参数空间图
figure;
plot(array_kaz2,array_kq2,'r*');
hold on;
plot(array_kaz2_half,array_kq2_half,'o');
hold on;
plot(array_kaz2_full,array_kq2_full,'kp');
grid on;
xlabel('kaz');
ylabel('kq');
title('二级品质');



% %正常模式下的闭环传递函数
% tf_u2az = -tf( M_dlte*K_alpha2az,[1 Z_alpha+M_q-M_dlte*kq M_alpha+Z_alpha*M_q-M_dlte*Z_alpha*kq-M_dlte*K_alpha2az*kaz] );

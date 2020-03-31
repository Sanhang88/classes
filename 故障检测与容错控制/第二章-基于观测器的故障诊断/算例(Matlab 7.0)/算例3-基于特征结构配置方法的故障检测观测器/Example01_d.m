%对应教材P16的例子,假定输出三个状态
clear;
clc;


%状态向量为[△θ △φ  △φ_dot ]，控制向量为[deltaII  deltaIV]
A = [ -0.022872   0.34878   0
       0          0         1
       -0.458771  0.458771  0.025332
    ];

B = [ 0.167254   0.167254
      0          0
      8.40879    8.40879
    ];

% C = [0 1 0;0 0 1];
C = eye(3);

fi_actuator = [ -0.167254             %执行器II失效故障的故障向量
                0
                -8.40879
             ];

fi_sensor = [  0                      %△φ传感器失效故障的故障向量
             -1                      
              0
           ];
       
%对偶系统矩阵
A_couple = A';
B_couple = C';
C_couple = B';

%求对偶系统的状态反馈增益阵K_couple
P = [-3;-4;-5]    %期望极点位置

K_couple = place(A_couple,B_couple,P)
D_actuator = K_couple'
           
           
           
% D_actuator = ( A*w_actuator - lamda_actuator*w_actuator )*Cw_actuator_pinv + E*( I - Cw_actuator*Cw_actuator_pinv )

[V,D]=eig(A - D_actuator*C )
 
 
 










           
%对应教材P16的例子,假定仅输出后两个状态
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

C = [0 1 0;0 0 1];
% C = eye(3);

fi_actuator = [ -0.167254             %执行器II失效故障的故障向量
                0
                -8.40879
             ];

fi_sensor = [  0                      %△φ传感器失效故障的故障向量
             -1                      
              0
           ];
       
lamdai = -6;
lamda2 = -3;

Afi_actuator = A*fi_actuator;
Cfi_actuator = C*fi_actuator;
Cfi_actuator_pinv = inv( Cfi_actuator'*Cfi_actuator )*Cfi_actuator';

Ci_actuator = ( eye(2) - Cfi_actuator*Cfi_actuator_pinv )*C;
Ai_actuator = A - ( Afi_actuator - lamdai*fi_actuator )*Cfi_actuator_pinv*C;
A2_actuator = A - ( Afi_actuator - lamda2*fi_actuator )*Cfi_actuator_pinv*C;

Mi_actuator = obsv( Ai_actuator,Ci_actuator );
qi_actuator = rank( Mi_actuator );
vi_actuator = rank( A ) -  qi_actuator

[V,D]=eig(Ai_actuator)
 ii = 1;
 
 w_actuator = V(:,ii)
 lamda_actuator = D(ii,ii)
%  
 Cw_actuator = C*w_actuator;
 Cw_actuator_pinv = inv( Cw_actuator'*Cw_actuator )*Cw_actuator';
 E = eye( 3,2 );
 I = eye( 2 );
 
%  D_actuator = ( A*w_actuator - lamda_actuator*w_actuator )*Cw_actuator_pinv + E*( I - Cfi_actuator*Cfi_actuator_pinv )
D_actuator = ( A*w_actuator - lamda_actuator*w_actuator )*Cw_actuator_pinv + E*( I - Cw_actuator*Cw_actuator_pinv )

[V,D]=eig(A - D_actuator*C )
 
 
 










           

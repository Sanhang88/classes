%��Ӧ�̲�P16������,�ٶ��������״̬
clear;
clc;


%״̬����Ϊ[���� ����  ����_dot ]����������Ϊ[deltaII  deltaIV]
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

fi_actuator = [ -0.167254             %ִ����IIʧЧ���ϵĹ�������
                0
                -8.40879
             ];

fi_sensor = [  0                      %���մ�����ʧЧ���ϵĹ�������
             -1                      
              0
           ];
       
%��żϵͳ����
A_couple = A';
B_couple = C';
C_couple = B';

%���żϵͳ��״̬����������K_couple
P = [-3;-4;-5]    %��������λ��

K_couple = place(A_couple,B_couple,P)
D_actuator = K_couple'
           
           
           
% D_actuator = ( A*w_actuator - lamda_actuator*w_actuator )*Cw_actuator_pinv + E*( I - Cw_actuator*Cw_actuator_pinv )

[V,D]=eig(A - D_actuator*C )
 
 
 










           
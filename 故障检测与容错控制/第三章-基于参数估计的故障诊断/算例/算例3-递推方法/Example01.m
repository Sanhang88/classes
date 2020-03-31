%基于MDL_example01的辨识
%数学模型为y(k)-1.5y(k-1)+0.7y(k-2)=u(k-1)+0.5u(k-2)+e(k)
clc
clear

N=1023;
sigma=0.01;

%理想系统模型
A = [ 1 -1.5 0.7 ];           %输出项系数
B = [ 0 1 0.5 ];              %输入项系数
C = 1;                        %误差项系数
M1 = idpoly(A,B,C);             %AR模型



%产生用于辨识的输入输出数据
uu= idinput(N,'prbs') ;
ee = idinput(N,'rgs')*sigma ;
Y1 = sim(M1,[uu,ee]);
Z = iddata(Y1,uu);



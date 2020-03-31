

%《系统辨识理论及应用》-李言俊，P56，例5.1，说明最小二乘法精度的结论：1、当不存在噪声时，估值精确;2、估值均方差随着噪声均方差增大而增大
%数学模型为y(k)-1.5y(k-1)+0.7y(k-2)=u(k-1)+0.5u(k-2)+e(k)
Cal_input;


%理想系统模型
A = [ 1 -1.5 0.7 ];           %输出项系数
B = [ 0 1 0.5 ];              %输入项系数
C = 1;                        %误差项系数
M1 = idpoly(A,B,C);             %AR模型
step(M1);hold on;grid on;


%产生用于辨识的输入输出数据
sim('MDL_example01');
U = iddata( [],uu(:,2) );       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
E = iddata( [],ee(:,2) );        %随机高斯白噪声序列作为噪声
Y1 = iddata( yy(2:(N+1)),[] );                       %输出数据
% Y1 = sim(M1,[U,E]);
Z = iddata(Y1,U);


obj=recursiveARX;
for i=1:length()





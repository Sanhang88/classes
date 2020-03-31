%����MDL_example01�ı�ʶ
%��ѧģ��Ϊy(k)-1.5y(k-1)+0.7y(k-2)=u(k-1)+0.5u(k-2)+e(k)
clc
clear

N=1023;
sigma=0.01;

%����ϵͳģ��
A = [ 1 -1.5 0.7 ];           %�����ϵ��
B = [ 0 1 0.5 ];              %������ϵ��
C = 1;                        %�����ϵ��
M1 = idpoly(A,B,C);             %ARģ��



%�������ڱ�ʶ�������������
uu= idinput(N,'prbs') ;
ee = idinput(N,'rgs')*sigma ;
Y1 = sim(M1,[uu,ee]);
Z = iddata(Y1,uu);



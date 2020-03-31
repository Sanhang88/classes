%矩阵奇异值分解算法，情况3：AA为实非方阵，
clear;
clc;

AA = [1 2 3;4 5 6]

%利用Matlab函数进行奇异值分解
[U,sigma,V]=svd(AA)


%验证正交对角分解的结论是否正确
AA_svd = U*sigma*V'



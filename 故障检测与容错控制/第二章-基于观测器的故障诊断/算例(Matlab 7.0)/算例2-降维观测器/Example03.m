%��⽵ά�۲���������
clear;
clc;

%ԭϵͳ����
A = [1 0 0;3 -1 1;0 2 0];
B = [2 1 1]';
C = [0 0 1];

%��һ������״̬����ά��n�����ά��q
n = rank(A);
q = rank(C);
t = n - q;

%�ڶ��������ݶ��壬����Q��
Q = [1 0 0;0 1 0;0 0 1];

%������������任���ϵͳ����,x_bar=inv(Q)*x,A_bar=Q*A*inv(Q),B_bar=Q*B,C_bar=C*inv(Q)�Լ���Ӧ���Ӿ���
A_bar = Q*A*inv(Q);
B_bar=Q*B;
C_bar=C*inv(Q);
for ii = 1:t
    for jj = 1:t
        A11_bar(ii,jj) = A_bar( ii,jj );
    end
    for jj = (t+1):n
        A12_bar(ii,jj-t) = A_bar( ii,jj );
    end
    B1_bar(ii,:) = B_bar(ii,:);
end
for ii = (t+1):n
    for jj = 1:t
        A21_bar(ii-t,jj) = A_bar( ii,jj );
    end
    for jj = (t+1):n
        A22_bar(ii-t,jj-t) = A_bar( ii,jj );
    end
    B2_bar(ii-t,:) = B_bar(ii,:);
end

%���Ĳ������ö�żԭ�����㽵ά�۲����������������L����ά�۲�������Ϊw_dot=(A11_bar-L*A21_bar)w+(B1_bar-L*B2_bar)u+[(A11_bar-L*A21_bar)L+A12_bar-L*A22_bar ]y_bar
P = [-3;-4];    %��ά�۲�����������λ��
K_couple = place(A11_bar',A21_bar',P);
L = K_couple'

%���岽���������յĽ�ά�۲�������w_dot=F*w+G*y+H*u,x1_bar_es=w+L*y
F = A11_bar-L*A21_bar
G = (A11_bar-L*A21_bar)*L+A12_bar-L*A22_bar
H = B1_bar-L*B2_bar

%���������������ԭϵͳ״̬x����ľ�����x_bar_es = [x1_bar_es y]' = AA*w + BB*y
for ii = 1:t
    AA(ii,ii) = 1;
    BB(ii,:) = L(ii,:);
end
for ii = (t+1):n
    AA(ii,:) = 0;
    BB(ii,ii-t) = 1;
end


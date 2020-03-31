%��϶��������˻��������ԣ������浽����������
clear;
close all;
clc;

N = 10;
sigma = 0;                                %����������
Ts = 0.1;
num = N/Ts;
u= idinput(num,'prbs') ;       %α�������λʽ��������Ϊ���룬��ϵͳ��ʶ�������룺M����
uu = [([1:num]*Ts)',u];
e = idinput(num,'rgs')*sigma ;        %�����˹������������Ϊ����
ee = [([1:num]*Ts)',e];

%����ģʽ�µ���Ӧ����
M_alpha = -1.94;
M_q = 0.11;
M_dlte = 1.3;
Z_alpha = 0.48;
Z_dlte = 0;
K_alpha2az = Z_alpha*177;
%����������϶�Ӧ��������Z_dlte��M_dlte�б仯�����಻��
Z_dlte_half = Z_dlte*0.75;
M_dlte_half = M_dlte*0.75;
Z_dlte_full = Z_dlte*0.5;
M_dlte_full = M_dlte*0.5;
%����ģʽ��Ӧ�Ĵ��ݺ���
tf_dlte2dtheta = -tf( [M_dlte M_dlte*Z_alpha-Z_dlte*M_alpha],...
    [1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );
%�����������϶�Ӧ���ݺ���
tf_dlte2dtheta_half = -tf( [M_dlte_half M_dlte_half*Z_alpha-...
    Z_dlte_half*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );
%������ȫ����϶�Ӧ���ݺ���
tf_dlte2dtheta_full = -tf( [M_dlte_full M_dlte_full*Z_alpha-...
    Z_dlte_full*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );

%����ģʽ��Ӧ�Ĵ��ݺ���
tf_dlte2dtheta_d=c2d(tf_dlte2dtheta,Ts)
%�����������϶�Ӧ���ݺ���
tf_dlte2dtheta_half_d=c2d(tf_dlte2dtheta_half,Ts)
%������ȫ����϶�Ӧ���ݺ���
tf_dlte2dtheta_full_d=c2d(tf_dlte2dtheta_full,Ts)

sim('MDL_example001');
order = [ 2 2 1 ];%ϵͳ�ͱ�
lam(1) = 1;%��������
zz = [yy(2:end),u];%��ȡ�������������װ��zz����

[nz,ns]=size(zz);%��ȡ���ݵĳ����Լ����ݵĿ��
na = order(1);%��ȡģ���ͱ����na
nb = order(2)%��ȡģ���ͱ����nb
nk = order(3);%��ȡģ���ͱ����nk
d=na+sum(nb);%��������������������ȡ
nbm=nb+nk-1;%��ȡu�Ľ״�
ncbm=na+cumsum([0 nbm]);%����������������������ȡ
dm=na+sum(nbm);
ii=[1:dm];
i=[1:na];
for ku=1:ns-1
    i=[i ncbm(ku)+nk(ku):ncbm(ku+1)];
end
phi=zeros(dm,1);
p0=10000*eye(d);
th0=eps*ones(d,1);


p=p0;
th=th0;
min_lam = 0.6;
max_lam = 0.8;
rou = 50;

for jj =1:num
    yh = phi(i)'*th;
    epsi = zz(jj,1) - yh;
    L(jj) = round(rou*epsi^2);
    lam(jj) = min_lam + (1-min_lam)^(2^L(jj));
    if lam(jj)>max_lam
        lam(jj) = max_lam;
    end
    if lam(jj)<min_lam
        lam(jj) = min_lam;
    end
    K=p*phi(i)/(lam(jj) + phi(i)'*p*phi(i));
    p=(p-K*phi(i)'*p)/lam(jj);
    th=th+K*epsi;
    epsilon(jj)=zz(jj,1)-th'*phi(i);
    phi(ii+1)=phi(ii);
    if na>0
        phi(1)=-zz(jj,1);
    end
    if any(ncbm>0)
        phi(ncbm(1:ns-1)+1)=zz(jj,2:ns)';
    end
    thm(jj,:)=th';
    yhat(jj)=yh;
end

figure();
plot([1:num]*Ts,thm(:,1)); %a1ϵ������ֵ
hold on;
plot([1:num]*Ts,a1(2:end));
l=legend('a1ϵ������ֵ','a1ϵ��ʵ��ֵ');
l.FontSize=18;
xlabel('��������')
grid on;
figure();
plot([1:num]*Ts,thm(:,2));       %a2ϵ������ֵ
hold on;
plot([1:num]*Ts,a2(2:end));
l=legend('a2ϵ������ֵ','a2ϵ��ʵ��ֵ');
l.FontSize=18;
grid on;
xlabel('��������')
figure();
plot([1:num]*Ts,thm(:,3));       %b1ϵ������ֵ
hold on;
plot([1:num]*Ts,b1(2:end));
l=legend('b1ϵ������ֵ','b1ϵ��ʵ��ֵ');
l.FontSize=18;
grid on;
xlabel('��������')
figure();
plot([1:num]*Ts,thm(:,4));       %b2ϵ������ֵ
hold on;
plot([1:num]*Ts,b2(2:end));
l=legend('b2ϵ������ֵ','b2ϵ��ʵ��ֵ');
l.FontSize=18;
grid on;
xlabel('��������')
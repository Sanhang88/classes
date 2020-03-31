%诊断对象是无人机纵向特性，升降舵到俯仰角速率
clear;
close all;
clc;

N = 10;
sigma = 0;                                %噪声均方差
Ts = 0.1;
num = N/Ts;
u= idinput(num,'prbs') ;       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
uu = [([1:num]*Ts)',u];
e = idinput(num,'rgs')*sigma ;        %随机高斯白噪声序列作为噪声
ee = [([1:num]*Ts)',e];

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
tf_dlte2dtheta = -tf( [M_dlte M_dlte*Z_alpha-Z_dlte*M_alpha],...
    [1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );
%升降舵半损故障对应传递函数
tf_dlte2dtheta_half = -tf( [M_dlte_half M_dlte_half*Z_alpha-...
    Z_dlte_half*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );
%升降舵全损故障对应传递函数
tf_dlte2dtheta_full = -tf( [M_dlte_full M_dlte_full*Z_alpha-...
    Z_dlte_full*M_alpha],[1 Z_alpha+M_q M_alpha+Z_alpha*M_q] );

%正常模式对应的传递函数
tf_dlte2dtheta_d=c2d(tf_dlte2dtheta,Ts)
%升降舵半损故障对应传递函数
tf_dlte2dtheta_half_d=c2d(tf_dlte2dtheta_half,Ts)
%升降舵全损故障对应传递函数
tf_dlte2dtheta_full_d=c2d(tf_dlte2dtheta_full,Ts)

sim('MDL_example001');
order = [ 2 2 1 ];%系统型别
lam(1) = 1;%遗忘因子
zz = [yy(2:end),u];%获取输入输出数据组装成zz数据

[nz,ns]=size(zz);%获取数据的长度以及数据的宽度
na = order(1);%获取模型型别参数na
nb = order(2)%获取模型型别参数nb
nk = order(3);%获取模型型别参数nk
d=na+sum(nb);%？？？？？？？？？获取
nbm=nb+nk-1;%获取u的阶次
ncbm=na+cumsum([0 nbm]);%？？？？？？？？？？获取
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
plot([1:num]*Ts,thm(:,1)); %a1系数估计值
hold on;
plot([1:num]*Ts,a1(2:end));
l=legend('a1系数估计值','a1系数实际值');
l.FontSize=18;
xlabel('迭代次数')
grid on;
figure();
plot([1:num]*Ts,thm(:,2));       %a2系数估计值
hold on;
plot([1:num]*Ts,a2(2:end));
l=legend('a2系数估计值','a2系数实际值');
l.FontSize=18;
grid on;
xlabel('迭代次数')
figure();
plot([1:num]*Ts,thm(:,3));       %b1系数估计值
hold on;
plot([1:num]*Ts,b1(2:end));
l=legend('b1系数估计值','b1系数实际值');
l.FontSize=18;
grid on;
xlabel('迭代次数')
figure();
plot([1:num]*Ts,thm(:,4));       %b2系数估计值
hold on;
plot([1:num]*Ts,b2(2:end));
l=legend('b2系数估计值','b2系数实际值');
l.FontSize=18;
grid on;
xlabel('迭代次数')
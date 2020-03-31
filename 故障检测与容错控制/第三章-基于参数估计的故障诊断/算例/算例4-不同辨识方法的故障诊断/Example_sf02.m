%带自适应遗忘因子的递推二乘法
%教材，P61，正常情况数学模型为y(k)-1.5y(k-1)+0.7y(k-2)=2u(k-1)+0.5u(k-2)+e(k)
clear
clc
Cal_input;


%理想系统模型
% A = [ 1 -1.5 0.7 ];           %输出项系数
% B = [ 0 1 0.5 ];              %输入项系数
% C = 1;                        %误差项系数
% M1 = idpoly(A,B,C);             %AR模型



%产生用于辨识的输入输出数据
sim('MDL_example01');
U = iddata( [],uu(:,2),Ts );       %伪随机“二位式”序列作为输入，即系统辨识典型输入：M序列
E = iddata( [],ee(:,2),Ts );        %随机高斯白噪声序列作为噪声
Y1 = iddata( yy(2:(num+1)),[],Ts );                       %输出数据
Z = iddata( Y1,U );%



%ARX模型参数的估计（带可变遗忘因子的递推最小二乘法，遗忘因子计算公式见文章“可变遗忘因子递推最小二乘法对时变参数测量_陈涵”）
order = [ 2 2 1 ];%系统型别
lam(1) = 1;                 %遗忘因子
y = pvget(Z,'OutputData');%获取输出数据
u = pvget(Z,'InputData')%获取输入数据
zz = [y{1},u{1}];%获取输入输出数据组装成zz数据

[nz,ns]=size(zz)%获取数据的长度以及数据的宽度
na = order(1);%获取模型型别参数na
nb = order(2)%获取模型型别参数nb
nk = order(3);%获取模型型别参数nk
d=na+sum(nb)%？？？？？？？？？获取
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
min_lam = 0.8;
max_lam = 1;
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
% Model_para = rarx(Z,order,'ff',0.95);       %遗忘因子越小，参数估计越能适应突变情况，但参数估值波动会越厉害，如果想兼顾估计精度和对参数变化的灵敏度，可以使用自适应遗忘因子法

figure(1);
plot([1:num]*Ts,thm(:,1));       %a1系数估计值
hold on;
plot([1:num]*Ts,thm(:,2),'r');       %a2系数估计值
hold on;
plot([1:num]*Ts,thm(:,3),'k');       %b1系数估计值
hold on;
plot([1:num]*Ts,thm(:,4),'c');       %b2系数估计值
grid on;
legend('系数a1','系数a2','系数b1','系数b2');

% figure;
% plot([0:num]*Ts,a1);
% %a1系数 
% hold on; 
% plot([1:num]*Ts,thm(:,1),'r');       %a1系数估计值     
% grid on;
% legend('系数a1','系数a1估计值');





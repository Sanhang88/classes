%kalman滤波方法
%教材，P61，正常情况数学模型为y(k)-1.5y(k-1)+0.7y(k-2)=2u(k-1)+0.5u(k-2)+e(k)
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
Z = iddata( Y1,U );



%ARX模型参数的估计（kalman滤波方法，《系统辨识理论及应用》-李言俊，P114有相应公式）
order = [ 2 2 1 ];
thm = rarx(Z,order,'kf',0.04*eye(4));       %遗忘因子越小，参数估计越能适应突变情况，但参数估值波动会越厉害，如果想兼顾估计精度和对参数变化的灵敏度，可以使用自适应遗忘因子法

% figure(1);
% plot([1:num]*Ts,thm(:,1));       %a1系数估计值
% hold on;
% plot([1:num]*Ts,thm(:,2),'r');       %a2系数估计值
% hold on;
% plot([1:num]*Ts,thm(:,3),'k');       %b1系数估计值
% hold on;
% plot([1:num]*Ts,thm(:,4),'c');       %b2系数估计值
% grid on;
% legend('系数a1','系数a2','系数b1','系数b2');

figure;
plot([0:num]*Ts,a1);                        %a1系数 
hold on; 
plot([1:num]*Ts,thm(:,1),'r');       %a1系数估计值     
grid on;
legend('系数a1','系数a1估计值');





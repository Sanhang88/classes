%���������ӵĵ��ƶ��˷�
%�̲ģ�P61�����������ѧģ��Ϊy(k)-1.5y(k-1)+0.7y(k-2)=2u(k-1)+0.5u(k-2)+e(k)
Cal_input;


%����ϵͳģ��
% A = [ 1 -1.5 0.7 ];           %�����ϵ��
% B = [ 0 1 0.5 ];              %������ϵ��
% C = 1;                        %�����ϵ��
% M1 = idpoly(A,B,C);             %ARģ��



%�������ڱ�ʶ�������������

U = iddata( [],uu(:,2),Ts );       %α�������λʽ��������Ϊ���룬��ϵͳ��ʶ�������룺M����
E = iddata( [],ee(:,2),Ts );        %�����˹������������Ϊ����
Y1 = iddata( yy(2:(num+1)),[],Ts );                       %�������
Z = iddata( Y1,U );



%ARXģ�Ͳ����Ĺ��ƣ����������ӵĵ�����С���˷�����ϵͳ��ʶ���ۼ�Ӧ�á�-���Կ���P112����Ӧ��ʽ��
order = [ 2 2 1 ];
lam = 0.8;                 %��������
y = pvget(Z,'OutputData');
u = pvget(Z,'InputData');
zz = [y{1},u{1}];

[nz,ns]=size(zz);
na = order(1);
nb = order(2);
nk = order(3);
d=na+sum(nb);
nbm=nb+nk-1;
ncbm=na+cumsum([0 nbm]);
dm=na+sum(nbm);
ii=[1:na+sum(nbm)];
i=[1:na];
for ku=1:ns-1
    i=[i ncbm(ku)+nk(ku):ncbm(ku+1)];
end
phi=zeros(dm,1);
p0=10000*eye(d);
th0=eps*ones(d,1);

p=p0;
th=th0;
for jj =1:num
    yh = phi(i)'*th;
    epsi = zz(jj,1) - yh;
    K=p*phi(i)/(lam + phi(i)'*p*phi(i));
    p=(p-K*phi(i)'*p)/lam;
    th=th+K*epsi;
    epsilon=zz(jj,1)-th'*phi(i);
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
% Model_para = rarx(Z,order,'ff',0.95);       %��������ԽС����������Խ����Ӧͻ���������������ֵ������Խ������������˹��ƾ��ȺͶԲ����仯�������ȣ�����ʹ������Ӧ�������ӷ�

% figure(1);
% plot([1:num]*Ts,thm(:,1));       %a1ϵ������ֵ
% hold on;
% plot([1:num]*Ts,thm(:,2),'r');       %a2ϵ������ֵ
% hold on;
% plot([1:num]*Ts,thm(:,3),'k');       %b1ϵ������ֵ
% hold on;
% plot([1:num]*Ts,thm(:,4),'c');       %b2ϵ������ֵ
% grid on;
% legend('ϵ��a1','ϵ��a2','ϵ��b1','ϵ��b2');

figure;
plot([0:num]*Ts,a1);                        %a1ϵ�� 
hold on; 
plot([1:num]*Ts,thm(:,1),'r');       %a1ϵ������ֵ     
grid on;
legend('ϵ��a1','ϵ��a1����ֵ');





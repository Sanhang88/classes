clear all;close all;
num=[30*4];
den=conv([1 0],[1 4]);
sys=tf(num,den)
figure(1);
rlocus(sys);   %���ϵͳ�Ĵ�Խ����Kr�ʹ�ԽƵ�ʦ�r

% numd=[0.2 1];
% dend=[0.02 1];
% sys_pid=tf(numd,dend)
% 
% sysc=sys*sys_pid;                        %У�����ϵͳ
% figure(2);
% rlocus(sysc);
% G=feedback(sysc,1);
% figure(3);
% step(G);

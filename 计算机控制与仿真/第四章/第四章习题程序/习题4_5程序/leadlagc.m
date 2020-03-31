%超前滞后校正传递函数leadlagc();
function [Gc]=leadlagc(sys,Wc,Gama,Kv,key)
[Gm,Pha]=bode(sys,Wc);
[num,den]=tfdata(sys,'v');
a=den(length(den):-1:1);
ii=find(abs(a)<=0);
sys_n=num(end);
if length(ii)>0
    a=a(ii(1)+1);
else
    a=a(1);
end
Phi_m=(Gama-Pha-180)*pi/180;
alfa=(1-sin(Phi_m))/(1+sin(Phi_m));
Zc=sqrt(alfa)*Wc;
Pc=Wc/sqrt(alfa);
Kc=sqrt(Wc*Wc+Pc*Pc)/(sqrt(Wc*Wc+Zc*Zc)*Gm);
K1=sys_n*Kc*alfa/a;
if nargin==4
    key=1;
    if Phi_m<0
        key=2;
    elseif K1<Kv
        key=3;
    end
end
switch key
    case 1
        Phi_m=(Gama-Pha-180+5)*pi/180;
        alfa=(1-sin(Phi_m))/(1+sin(Phi_m));
        Zc=sqrt(alfa)*Wc;
        Pc=Wc/sqrt(alfa);
        Kc=sqrt(Wc*Wc+Pc*Pc)/(sqrt(Wc*Wc+Zc*Zc)*Gm);
        Gc=tf([1/Zc 1]*Kc*Zc/Pc,[1/Pc 1],'variable','s');
    case 2
        Kc=1/Gm;
        K1=sys_n*Kc/a;
        %Gc=tf([1 0.1*Wc],[1 K1*Wc*0.1/Kv]);
        Gc=(Kc*Kv/K1)*tf([1/(0.1*Wc) 1],[1/(K1*Wc*0.1/Kv) 1],'variable','s');
    case 3
        Phi_m=(Gama-Pha-180+6)*pi/180;
        alfa=(1-sin(Phi_m))/(1+sin(Phi_m));
        Zc=sqrt(alfa)*Wc;
        Pc=Wc/sqrt(alfa);
        Kc=sqrt(Wc*Wc+Pc*Pc)/(sqrt(Wc*Wc+Zc*Zc)*Gm);
        K1=sys_n*Kc*alfa/a;
        Zc2=Wc*0.1;
        Pc2=K1*Zc2/Kv;
        Gcn=Kc*conv([1 Zc],[1 Zc2]);
        Gcd=conv([1 Pc],[1 Pc2]);
        Gc1=tf(Gcn,Gcd,'variable','s');
        Gc=zpk(Gc1);
end
      
        

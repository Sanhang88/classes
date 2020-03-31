function Gw=Tustinbh(sys,ts)
syms z w x sysz
dsys=c2d(sys,ts,'zoh');
sysz=zpk(dsys)
sysw=d2c(dsys,'tustin');
Gw=zpk(sysw);
[num1,den1]=tfdata(Gw,'v');
for j=1:1:length(num1)
    if abs(num1(j))<=10^-5
        num1(j)=0;
    end
end
for i=1:1:length(den1)
    if abs(den1(i))<=10^-5
        den1(i)=0;
    end
end
Gws=tf(num1,den1,'variable','p');
Gw=zpk(Gws)


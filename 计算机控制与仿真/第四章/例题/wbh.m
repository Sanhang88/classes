function Gw=wbh(sys,ts)
syms z w 
dsys=c2d(sys,ts,'zoh');
dsys1=zpk(dsys)
fsysz=tf2sym(dsys)
z=(1+0.5*ts*w)/(1-0.5*ts*w);
gg=compose(fsysz,z);
G=simplify(gg);
sysw=sym2tf(G);
Gw=zpk(sysw);
[num1,den1]=tfdata(Gw,'v');
for j=1:1:length(num1)
    if abs(num1(j))<=10^-7
        num1(j)=0;
    end
end
for i=1:1:length(den1)
    if abs(den1(i))<=10^-7
        den1(i)=0;
    end
end
Gws=tf(num1,den1);
Gw=zpk(Gws)


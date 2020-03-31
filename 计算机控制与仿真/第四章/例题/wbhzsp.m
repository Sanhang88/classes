function Gw=wbhzsp(sys,ts)
syms z w x sysz
dsys=c2d(sys,ts,'zoh');
dsys1=zpk(dsys)
[num,den]=tfdata(dsys,'v');
numz=poly2sym(num);
denz=poly2sym(den);
sysz=numz/denz;
z=(1+0.5*ts*w)/(1-0.5*ts*w);
gg=compose(sysz,z);
G=simplify(gg);
[n,d]=numden(G);
numw1=sym2poly(n);
denw1=sym2poly(d);
Gs=tf(numw1,denw1);
Gszpk=zpk(Gs);
[num1,den1]=tfdata(Gszpk,'v');
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


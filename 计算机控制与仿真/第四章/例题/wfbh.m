function Gz=wfbh(Gc,ts)
syms z w 
[num,den]=tfdata(Gc,'v');
num1=poly2sym(num);
den1=poly2sym(den);
sys1=num1/den1;
w=(2/ts)*(z-1)/(z+1);
gg=compose(sys1,w);
G=simplify(gg);
[n,d]=numden(G);
numz1=sym2poly(n);
denz1=sym2poly(d);
sysz=tf(numz1,denz1,ts);
dsysz=zpk(sysz)
[numz2,denz2]=tfdata(dsysz,'v');
Gz=tf(numz2,denz2,ts);


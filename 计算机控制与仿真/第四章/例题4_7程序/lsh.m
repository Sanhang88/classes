function Gz=lsh(sys,ts)
dsys=c2d(sys,ts,'zoh');
Gz=zpk(dsys);


function G=sym2tf(P)
[n,d]=numden(P);
G=tf(sym2poly(n),sym2poly(d));
    

%滞后校正传递函数lagc();
function [Gc]=lagc(key,sys,var)
if key==1
    gama=var(1);
    gama1=gama+5;
    [mag,phase,W]=bode(sys);
    wc=spline(phase,W',(gama1-180))
elseif key==2
    wc=var(1);
end
    num=sys.num{1};
    den=sys.den{1};
    na=polyval(num,j*wc);
    da=polyval(den,j*wc);
    g=na/da;
    g1=abs(g);
    h=20*log10(g1);
    beat=10^(h/20)
    T=10/wc;
    Gc=tf([T 1],[beat*T 1]);

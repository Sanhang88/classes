%超前校正传递函数leadc();
function [Gc]=leadc(key,sys,var)
if key==1
    gama=var(1);
    gama1=gama;
    [mag,phase,W]=bode(sys);
    [Gm,Pha]=bode(sys,W);
    phi_m=gama1*pi/180;
    alfa=(1-sin(phi_m))/(1+sin(phi_m));
    adb=20*log10(Gm);
    am=10*log10(alfa);
    Wc=spline(adb,W,am);
    T=1/(Wc*sqrt(alfa));
    Gc=tf([T 1],[alfa*T 1]);
elseif key==2
    wc=var(1);
    num=sys.num{1};
    den=sys.den{1};
    na=polyval(num,j*wc);
    da=polyval(den,j*wc);
    g=na/da;
    g1=abs(g);
    h=20*log10(g1);
    alfa=10^(h/10)
    T=1/(wc*sqrt(alfa));
    Gc=tf([T 1],[alfa*T 1]);
elseif key==3
    gama=var(1);
    wc=var(2);
    gama1=gama;
    num=sys.num{1};
    den=sys.den{1};
    ngv=polyval(num,j*wc);
    dgv=polyval(den,j*wc);
    g=ngv/dgv;
    thetag=angle(g);
    mg=abs(g);
    p_m=gama1*pi/180;
    z=(1+mg*cos(p_m-thetag))/(-wc*mg*sin(p_m-thetag));
    p=(cos(p_m-thetag)+mg)/(wc*sin(p_m-thetag));
    Gc=tf([z 1],[p 1]);
end



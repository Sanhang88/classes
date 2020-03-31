%根轨迹超前校正传递函数rtloc();
function [Gc]=rtloc(key,sys,var)
num=sys.num{1};
den=sys.den{1};
s1=var(1);
ngv=polyval(num,s1);
dgv=polyval(den,s1);
g=ngv/dgv;
if key==1
    zeta=angle(g);
    if zeta>0
        phic=pi-zeta;
    end
     if zeta<0
        phic=-zeta;
    end
    phi=angle(s1);
    zetaz=(phi+phic)/2;
    zetap=(phi-phic)/2;
    zc=real(s1)-imag(s1)/tan(zetaz);
    pc=real(s1)-imag(s1)/tan(zetap);
    nc=[1 -zc];
    dc=[1 -pc];
    nv=polyval(nc,s1);
    dv=polyval(dc,s1);
    kv=nv/dv;
    kc=abs(1/(g*kv));
    if zeta<0
        kc=-kc;
    end
    kc
    Gc1=kc*tf(nc,dc);
    Gc=zpk(Gc1)
elseif key==2
    kc=var(2);
    zetag=angle(g);
    mg=abs(g);
    ms=abs(s1);
    zetas=angle(s1);
    tz=(sin(zetas)-kc*mg*sin(zetag-zetas))/(kc*mg*ms*sin(zetag));
    tp=-(sin(zetag+zetas)+kc*mg*sin(zetas))/(ms*sin(zetag));
    nc=[tz,1];
    dc=[tp,1];
    Gc1=kc*tf(nc,dc);
    Gc=zpk(Gc1)
end


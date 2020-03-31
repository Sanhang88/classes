%超前校正传递函数leadczsp();
function [Gc]=leadczsp(key,sys,var)
if key==1
    gama=var(1);
    gama1=gama+5;
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
    [Gm,Pha]=bode(sys,wc);
    adb=20*log10(Gm);
    alfa=10^(adb/10)
    T=1/(wc*sqrt(alfa));
    Gc=tf([T 1],[alfa*T 1]);
elseif key==3
    gama=var(1);
    wc=var(2);
    [Gm,Pha]=bode(sys,wc);
    phi_m=(gama-Pha-180+5)*pi/180;
    alfa=(1-sin(phi_m))/(1+sin(phi_m))
    T=1/(wc*sqrt(alfa));
    Gc=tf([T 1],[alfa*T 1]);
end



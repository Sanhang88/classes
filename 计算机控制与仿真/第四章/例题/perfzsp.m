%求解时域指标sigma,tp,ts
function [sigma,tp,ts]=perfzsp(key,y,t)
[mp,tf]=max(y);
cs=length(t);
yss=y(cs);
sigma=100*(mp-yss)/yss;
tp=t(tf);
i=cs+1;
n=0;
while n==0
    i=i-1;
    if key==1
        if i==1
            n=1;
        elseif abs(y(i)-yss)>0.05*yss
            n=1;
        end
    elseif key==2
         if i==1
            n=1;
        elseif abs(y(i)-yss)>0.02*yss
            n=1;
        end
    end
end
ts=t(i);

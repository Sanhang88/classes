%遇限削弱积分子算法
function alpha=pidsf(u1,u2)
um=10;
if u2>=um
    if u1>0
        alpha=0;
    else 
        alpha=1;
    end
elseif u2<=-um
    if u1>0
        alpha=1;
    else 
        alpha=0;
    end
else
    alpha=1;
end
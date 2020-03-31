%有效偏差法子算法
function ek=pidsf(u1,u2,u3)

if u3==6|u3==-6
   ek=u2;
else
   ek=u1;
end




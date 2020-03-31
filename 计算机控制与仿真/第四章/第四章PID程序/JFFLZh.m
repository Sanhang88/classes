% 积分分离子算法(课本)
function beat=pidsf(ek)

   if abs(ek)<=0.7
       beat=1;
   else
       beat=0;
   end

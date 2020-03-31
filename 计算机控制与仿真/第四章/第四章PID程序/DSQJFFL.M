%采用积分分离的带死区的PID子算法

function [beta]=pidsf(u1)

   if abs(u1)<=0.2
       beta=1;
   else
       beta=0;
   end

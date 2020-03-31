%带死区的PID子算法
function epsilon=pidsf(ek)

   if abs(ek)<=0.13
       epsilon=0;
   else
      epsilon=1;
  end

%采样信号的函数
function A=Fw1(T,w,ws)
A=(1/T)*5.0/sqrt((10*10+(w+ws)^2));

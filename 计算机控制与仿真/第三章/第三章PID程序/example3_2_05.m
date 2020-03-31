%四方向逐点比较法四象限直线等步长插补(终点判断方法①,步长为0.5)
%example 3.2
clear all;clc;
F=0;
x=0;y=0;
dx=0.6; dy=0.4;     %步长
xe=-6;ye=4;
dmin=min(dx,dy)/2.0;
K=ye/xe;
xx(1)=x;yy(1)=y;
Index=2;
while(1)
    if(F>=0)
        if(xe>0)
            x=x+dx;
        else
            x=x-dx;
        end
        y=y;
        F=F-abs(ye*dx);
    else
        if(ye>0)
            y=y+dy;
        else
            y=y-dy;
        end
        x=x;
        F=F+abs(xe*dy);
    end
    xx(Index)=x;
    yy(Index)=y;
    Index=Index+1;
%     if(abs((abs(x)+abs(y))-(abs(xe)+abs(ye)))<dmin)    %对终点判断做的限制，不然有时会多走一步
%         break;
%     end
    if((abs(x)+abs(y))>=(abs(xe)+abs(ye)))
        break;
    end
end
if(xe>0)
    xxx=0:0.001:xe;
else
    xxx=0:-0.001:xe;
end
yyy=K*xxx;
if(xe>0)
    plot(xx,yy,'r->',xxx,yyy,'b');
else
    plot(xx,yy,'r<-',xxx,yyy,'b');
end   
grid on;
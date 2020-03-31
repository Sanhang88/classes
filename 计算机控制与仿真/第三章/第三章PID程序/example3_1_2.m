%四方向逐点比较法四象限直线等步长插补(终点判断方法②,步长不为1)example 3-1-2
clear all;clc;
F=0;
x=0;y=0;
dx=0.5;          %步长
dy=0.5;          %步长
xe=-6;ye=4;
Nxy=max(abs(xe),abs(ye));  
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
        if(abs(xe)>=abs(ye))
            Nxy=Nxy-dx;
        end
        y=y;
        F=F-abs(ye);
    else
        if(ye>0)
            y=y+dy;
        else
            y=y-dy;
        end
        if(abs(xe)<abs(ye))
            Nxy=Nxy-dy;
        end
        x=x;
        F=F+abs(xe);
    end
    xx(Index)=x;
    yy(Index)=y;
    Index=Index+1;
    if(Nxy<=0)
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
%�ķ������ȽϷ�������ֱ�ߵȲ����岹(�յ��жϷ�����,����Ϊ0.5)
%example 3.2
clear all;clc;
F=0;
x=0;y=0;
dx=0.6; dy=0.4;     %����
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
%     if(abs((abs(x)+abs(y))-(abs(xe)+abs(ye)))<dmin)    %���յ��ж��������ƣ���Ȼ��ʱ�����һ��
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
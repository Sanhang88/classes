import Initialize
import Interpolate
import ShowResult
import numpy
from scipy import interpolate
from numpy import sin,cos,tan

#初始化获得各参数及插值表及迭代初值
(alp1,ma1,cx0,alpha2,ma2,cy0,yh,ph,ah)=Interpolate.interpolation();
(u,t,xt,v,x,y,Drx,cx,cya,alpj,alph,thtj,thth,v0,t0,x0,y0,alp0,tht0,Is,g,P,p0,vt,dt0,yt0,xt0,a,cotq0)=Initialize.initialize(yh,ah);

#迭代参量及迭代步长
i=0;
h=0.0001;

# 龙格库塔迭代
while (y[i]<yt0):
    ma=v[i]/a;
    cotq=cotq0-u[i]*Is*vt/[P*g*yt0];
    p=interpolate.interp1d(yh,ph)(y[i]);#插值得到密度
    a=interpolate.interp1d(yh,ah)(y[i]);#插值得到音速
    CCX=interpolate.interp2d(alp1,ma1,cx0,kind='linear');
    cx[i] =CCX(alpj[i],ma);
    CCYA=interpolate.interp2d(alpha2,ma2,cy0,kind='linear');
    cya[i] =180/numpy.pi*CCYA(alpj[i],ma);
    Kv1 = Is / (1 - u[i]) - p * v[i] ** 2 * cx[i] * Is / (2 * P * p0 * (1 - u[i])) - Is / P * sin(thth[i]);
    Kv2 = Is / (1 - (u[i] + h / 2)) - p * (v[i] + h / 2 * Kv1) ** 2 * cx[i] * Is / (
                2 * P * p0 * (1 - (u[i] + h / 2))) - Is / P * sin(thth[i]);
    Kv3 = Is / (1 - (u[i] + h / 2)) - p * (v[i] + h / 2 * Kv2) ** 2 * cx[i] * Is / (
                2 * P * p0 * (1 - (u[i] + h / 2))) - Is / P * sin(thth[i]);
    Kv4 = Is / (1 - (u[i] + h)) - p * (v[i] + h * Kv3) ** 2 * cx[i] * Is / (
                2 * P * p0 * (1 - (u[i] + h))) - Is / P * sin(thth[i]);
    Kth1 = vt / yt0 * (Is / (P * g) + (
                v[i] / (P * g) * Is * v[i] * sin(thth[i]) - y[i] * (Kv1 + 2 * Kv2 + 2 * Kv3 + Kv4) / 6) / (
                                   v[i] ** 2 * sin(thth[i]))) / (
                       1 + (cotq0 - u[i] * Is * vt / (P * g * yt0)) / tan(thth[i]));
    Kth2 = vt / yt0 * (Is / (P * g) + (v[i] / (P * g) * Is * v[i] * sin(thth[i] + Kth1 * h / 2) - y[i] * (
                Kv1 + 2 * Kv2 + 2 * Kv3 + Kv4) / 6) / (v[i] ** 2 * sin(thth[i] + Kth1 * h / 2))) / (
                       1 + (cotq0 - (u[i] + h / 2) * Is * vt / (P * g * yt0)) / tan(thth[i] + Kth1 * h / 2));
    Kth3 = vt / yt0 * (Is / (P * g) + (v[i] / (P * g) * Is * v[i] * sin(thth[i] + Kth2 * h / 2) - y[i] * (
                Kv1 + 2 * Kv2 + 2 * Kv3 + Kv4) / 6) / (v[i] ** 2 * sin(thth[i] + Kth2 * h / 2))) / (
                       1 + (cotq0 - (u[i] + h / 2) * Is * vt / (P * g * yt0)) / tan(thth[i] + Kth2 * h / 2));
    Kth4 = vt / yt0 * (Is / (P * g) + (
                v[i] / (P * g) * Is * v[i] * sin(thth[i] + Kth3 * h) - y[i] * (Kv1 + 2 * Kv2 + 2 * Kv3 + Kv4) / 6) / (
                                   v[i] ** 2 * sin(thth[i] + Kth3 * h))) / (
                       1 + (cotq0 - (u[i] + h) * Is * vt / (P * g * yt0)) / tan(thth[i] + Kth3 * h));
    v[i + 1] = v[i] + (Kv1 + 2 * Kv2 + 2 * Kv3 + Kv4) * h / 6;
    y[i + 1] = y[i] + Is * v[i] * sin(thth[i]) / (P * g) * h;
    x[i + 1] = x[i] + Is * v[i] * cos(thth[i]) / (P * g) * h;
    thth[i + 1] = thth[i] + (Kth1 + 2 * Kth2 + 2 * Kth3 + Kth4) * h / 6;
    thtj[i + 1] = thth[i + 1] * 180 / numpy.pi;
    alph[i] = (v[i] * (Kth1 + 2 * Kth2 + 2 * Kth3 + Kth4) / 6 + Is * cos(thth[i]) / P) / (
                p * (v[i]) ** 2 * cya[i] * Is / (2 * P * p0 * (1 - u[i])) + Is / (1 - u[i]));
    alpj[i + 1] = alph[i] * 180 / numpy.pi;
    t[i + 1] = yt0 / vt * (cotq0 - cotq);
    xt[i + 1] = cotq * yt0;
    Drx[i + 1] = ((x[i + 1] - xt[i + 1]) ** 2 + (y[i + 1] - yt0) ** 2)**0.5;
    u[i + 1] = u[i] + h;
    i = i + 1;

#作图
ShowResult.showResult(u,alpj,i,ma,alpha2,ma2,cy0,cya,yt0,t,y,thtj,v,Drx,xt,x)
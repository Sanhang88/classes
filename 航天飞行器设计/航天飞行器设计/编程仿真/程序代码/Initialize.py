import numpy
from scipy import interpolate
def initialize(yh,ah):
    #导弹分离时参数
    u=numpy.arange(1,500,0.1);#质量分数初始化
    t=numpy.arange(1,500,0.1);#时间初始化
    xt=numpy.arange(1,500,0.1);#目标x方位初始化
    v=numpy.arange(1,500,0.1);#速度初始化
    x=numpy.arange(1,500,0.1);#导弹x方位初始化
    y=numpy.arange(1,500,0.1);#导弹y方位初始化
    dr=numpy.arange(1,500,0.1);#弹幕距离初始化
    cx=numpy.arange(1,500,0.1);
    cya=numpy.arange(1,500,0.1);
    alpj=numpy.arange(1,500,0.1);#俯仰角初始化（度）
    alph=numpy.arange(1,500,0.1);#俯仰角初始化（弧）
    thtj=numpy.arange(1,500,0.1);#弹道倾角初始化（度）
    thth=numpy.arange(1,500,0.1);#弹道倾角初始化（弧）
    v0=500;#初速度
    t0=3;#初始时间
    x0=674.0;#初始x方位
    y0=329;#初始y方位
    alp0=1.5;#初始alp角（度）
    tht0=26;#初始tht角（度）
    #动力系数
    Is=2156;#发动机比冲
    g=9.801;#重力加速度
    P=2.2;#推重比
    p0=5880;#翼载
    #目标特性
    vt=420;#目标速度
    dt0=34200;#初始时刻弹目矩
    yt0=15000;#目标y方向初始位置
    xt0=numpy.sqrt(dt0**2-(yt0-y0)**2)+x0;#目标x方向初始位置
    u[0] = 0;  # 初始
    t[0] = 0;  # 初始时间
    xt[0] = xt0;  # 目标初始位置
    cotq0 = xt0 / yt0;  # 初视线角余切
    v[0] = v0;  # 导弹初始速度
    x[0] = x0;  # 导弹初始x
    y[0] = y0;  # 导弹初始y
    dr[0] = ((x[0] - xt[0]) ** 2 + (y[0] - yt0) ** 2) ** 0.5;  # 弹目初始距离
    a = interpolate.interp1d(yh, ah)(y[0]);  # 插值得到音速
    alpj[0] = alp0;  # 初始俯仰角（度）
    alph[0] = alpj[0] / 180 * numpy.pi;  # 初始俯仰角（弧）
    thtj[0] = tht0;  # 初始弹道倾角[度]
    thth[0] = thtj[0] / 180 * numpy.pi;  # 初始弹道倾角（弧）
    return (u,t,xt,v,x,y,dr,cx,cya,alpj,alph,thtj,thth,v0,t0,x0,y0,alp0,tht0,Is,g,P,p0,vt,dt0,yt0,xt0,a,cotq0);

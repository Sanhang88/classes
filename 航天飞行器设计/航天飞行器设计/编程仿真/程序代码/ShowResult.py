from scipy import interpolate
import numpy
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签
plt.rcParams['axes.unicode_minus']=False #用来正常显示负号

def showResult(u,alphaj,i,ma,alpha2,ma2,cy0,cya,yt0,t,y,thetaj,v,dr,xt,x):
    print(' 计算得导弹的相对质量因数为:', u[i], '\n');
    print(' 击中目标前导弹的攻角为:', alphaj[i], '\n');
    CYA = interpolate.interp2d(alpha2, ma2, cy0, kind='linear')(alphaj[i], ma);
    cya[i] = 180 / numpy.pi * CYA;
    yt = numpy.linspace(yt0, yt0, i);
    plt.figure('导弹飞行高度随时间变化曲线')
    plt.title('导弹飞行高度随时间变化曲线')
    plt.plot(t[:i], y[:i])
    plt.xlabel('t/s')
    plt.ylabel('角度(°)')
    plt.figure(' 迎角随时间变化曲线')
    plt.title(' 迎角随时间变化曲线')
    plt.plot(t[:i], alphaj[:i])
    plt.xlabel("t/s")
    plt.ylabel("角度(°)")
    plt.figure(' 俯仰角随时间变化曲线')
    plt.title(' 俯仰角随时间变化曲线')
    plt.plot(t[:i], thetaj[:i] + alphaj[:i])
    plt.xlabel('t/s')
    plt.ylabel('角度(°)')
    plt.figure(' 弹道倾角随时间变化曲线')
    plt.plot(t[:i], thetaj[:i])
    plt.title(' 弹道倾角随时间变化曲线')
    plt.ylabel('角度(°)')
    plt.xlabel('t/s')
    plt.figure(' 导弹速度随时间变化曲线')
    plt.plot(t[:i], v[:i])
    plt.title(' 导弹速度随时间变化曲线')
    plt.xlabel('t/s')
    plt.ylabel('m/s')
    plt.figure(' 单目斜距随时间变化曲线')
    plt.plot(t[:i], dr[:i])
    plt.title(' 单目斜距随时间变化曲线')
    plt.xlabel('t/s')
    plt.ylabel('m/s')
    plt.figure(' 导弹和目标飞行高度随水平位置变化曲线');
    plt.plot(x[:i], y[:i])
    plt.plot(xt[:i], yt[:i])
    for j in numpy.arange(0, 3600,600 ):
        plt.plot((0, x[j]), (0, y[j]))
        plt.plot((0, xt[j]), (0, yt[j]))

    plt.title(' 导弹和目标飞行高度随水平位置变化曲线')
    plt.xlabel('x/m')
    plt.ylabel('y/m')
    plt.figure('高度随相对质量因数变化曲线')
    plt.plot(u[:i], y[:i])
    plt.title('高度随相对质量因数变化曲线')
    plt.xlabel('u')
    plt.ylabel('角度(°)')
    plt.figure(' 攻角随相对质量因数变化曲线')
    plt.plot(u[:i], alphaj[:i])
    plt.title(' 攻角随相对质量因数变化曲线')
    plt.xlabel('u')
    plt.ylabel(' 角度(°) ')
    plt.figure(' 迎角随水平距离变化曲线')
    plt.plot(x[:i], alphaj[:i])
    plt.title(' 迎角随水平距离变化曲线')
    plt.xlabel('x m')
    plt.ylabel(' 角度(°) ')
    plt.figure('相对质量因数随时间的变化曲线')
    plt.title('相对质量因数随时间的变化曲线')
    plt.plot(t[:i],u[:i])
    plt.xlabel('t/s')
    plt.ylabel('u')
    plt.show()

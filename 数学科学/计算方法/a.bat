setlocal enabledelayedexpansion
for %%i in (*ppt) do (
set b=%%i
set x=!b:^(计算方法^)=^(计算方法^).!
ren %%i !x!
)
ren CHARPTER1.PPT a.ttt
pause
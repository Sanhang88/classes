setlocal enabledelayedexpansion
for %%i in (*ppt) do (
set b=%%i
set x=!b:^(���㷽��^)=^(���㷽��^).!
ren %%i !x!
)
ren CHARPTER1.PPT a.ttt
pause
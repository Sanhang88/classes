@echo off
setlocal enabledelayedexpansion
if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("%~fs0 h",0)(window.close)&&exit 
:begin
for %%i in (*) do (
set b=%%i
set a=!b:~-1!
for /l %%c in (1,1,30) do set b=!b:*\=!
set b=!b:~0,-37!
set x=!b!¿¢¹¤Í¼Ö½!c!
if not "!a!" == "t" ren "%%i" "!b!"
)
ENDLOCAL

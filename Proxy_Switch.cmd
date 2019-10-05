@ECHO OFF
cls

rem Geschrieben von
rem Matthias Pröll <proell.matthias@gmail.com>
rem Letzte Anpassung: 2019/10/05

FOR /F "tokens=*" %%g IN ('reg QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable') do (SET CHECK=%%g)
FOR /F "tokens=*" %%f IN ('echo %CHECK:~30,29%') do (SET CHECK=%%f)

if %CHECK% == 0 (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f > NUL 2>&1
    echo Proxy is now enabled!
) else ( if %CHECK% == 1 (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f > NUL 2>&1
    echo Proxy is now disabled!
))
pause

exit 0

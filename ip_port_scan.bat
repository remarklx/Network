@echo off
::set /p ip="ip field, prefix like "192.168.1." >>> "
::set /p port="Port, like 20 >>> "
set ip=10.251.101.1
set port=20
for /L %%i in (1,1,254) do (
Ping.exe -n 1 -l 16 -w 100 %ip%%%i>>ipscan.txt
if not errorlevel 1 (
echo %ip%%%i yes
::Need to download [tcping.exe](https://www.elifulkerson.com/projects/tcping.php)
D:\exe\tcping.exe %ip%%%i %port% > temp
if not errorlevel 1 (
echo Port%port% exist
%ip%%%i >> valid_ip.txt
)
)
)
del temp
del ipscan.txt
echo valid ip with valid port %port% as followed:
more valid_ip.txt
pause

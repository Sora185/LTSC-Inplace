@echo off
chcp 65001 >NUL

:checkAdmin
echo >C:\test.txt
cls
IF EXIST "C:\test.txt" del C:\test.txt && goto :start
IF NOT EXIST "C:\test.txt" goto noAdmin
exit

:start
cd /d %~dp0
start "" .\_Dateien\Cleaner\Cleaner.bat
goto :end

:noAdmin
mode con cols=60 lines=9
echo.
echo ============================================================
echo Fehler: Skript muss als Admin gestartet werden!
echo ============================================================
echo.
pause
goto :end

:end
exit
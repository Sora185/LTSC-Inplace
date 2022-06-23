@echo off
title Inplace-Upgrade LTSC 2019

:checkAdmin
echo >C:\test.txt
cls
IF EXIST "C:\test.txt" del C:\test.txt && goto start
IF NOT EXIST "C:\test.txt" goto noAdmin
exit

:start
cd /d "%~dp0\_Dateien\LTSC19"
IF EXIST "%USERPROFILE%\Desktop\Inplace-Upgrade_LTSC19" rd /S /Q "%USERPROFILE%\Desktop\Inplace-Upgrade_LTSC19"
robocopy . "%USERPROFILE%\Desktop\Inplace-Upgrade_LTSC19" /E /NJH /NJS
cd /d "%USERPROFILE%\Desktop\Inplace-Upgrade_LTSC19"
start "" setup.exe /auto upgrade /showoobe none
exit

:noAdmin
mode con cols=60 lines=8
echo.
echo ============================================================
echo Fehler: Skript muss als Admin gestartet werden!
echo ============================================================
echo.
pause
exit
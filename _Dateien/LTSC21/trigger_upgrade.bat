@echo off
title Inplace-Upgrade LTSC 2021

:checkAdmin
echo >C:\test.txt
cls
IF EXIST "C:\test.txt" del C:\test.txt && goto start
IF NOT EXIST "C:\test.txt" goto noAdmin
exit

:start
cd /d "%~dp0"
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
@echo off
chcp 65001 >NUL
title Inplace-Upgrade Cleaner

:checkAdmin
echo >C:\test.txt
cls
IF EXIST "C:\test.txt" del C:\test.txt && goto :start
IF NOT EXIST "C:\test.txt" goto noAdmin
exit

:start
mode con cols=60 lines=15
cd /d %~dp0

echo ^>Registrykeys werden gesetzt
start /wait "" .\helper\regset.bat

echo ^>Datenträgerbereinigung wird gestartet
start /wait "" cleanmgr /sagerun:1

echo ^>Registrykeys werden gelöscht
start /wait "" .\helper\regdel.bat

echo ^>Inplace-Upgrade-Dateien werden entfernt
start /wait "" .\helper\filedel.bat

echo ^>Konfiguriere Dienst "WebClient"
start /wait "" .\helper\webclient.bat

echo ^>Aktiviere Remotedesktop-Firewallregeln
start /wait "" .\helper\enable_rdp.bat

echo.
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
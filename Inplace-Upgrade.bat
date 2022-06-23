@echo off
chcp 65001 >NUL
title Inplace-Upgrade

:checkAdmin
title Inplace-Upgrade ^| checkAdmin
echo >C:\test.txt
cls
IF EXIST "C:\test.txt" del C:\test.txt && goto :start
IF NOT EXIST "C:\test.txt" goto noAdmin
exit

:start

::Überprüfung der jetzigen Windows-Version
::----------------------------------------

title Inplace-Upgrade ^| Prüfe Windows-Version...
goto :Check-LTSB2016

:Check-LTSB2016
ver | findstr 10.0.14393 >NUL
IF %ERRORLEVEL%==0 (
	echo ^>LTSB 2016 erkannt
	choice /c "jn" /n /m ">Soll LTSC 2021 auch kopiert werden? (j/n) "
	cls
	::Nein
	IF ERRORLEVEL 2 (
		call :Copy-LTSC2019
		goto :Inst-LTSC2019
	)
	::Ja
	IF ERRORLEVEL 1 (
		call :Copy-All
		goto :Inst-LTSC2019
	)
)
IF %ERRORLEVEL%==1 goto :Check-LTSC2019

:Check-LTSC2019
ver | findstr 10.0.17763 >NUL
IF %ERRORLEVEL%==0 (
	call :Copy-LTSC2021
	goto :Inst-LTSC2021
)
IF %ERRORLEVEL%==1 goto :Check-LTSC2021

:Check-LTSC2021
ver | findstr 10.0.19044 >NUL
IF %ERRORLEVEL%==0 goto :Aktuell
IF %ERRORLEVEL%==1 goto :CheckError


::Installationen
::--------------

:Inst-LTSC2019
title Inplace-Upgrade ^| LTSC 2019 - Installation
cd /d "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC19"
start "" setup.exe /auto upgrade /showoobe none
goto :end

:Inst-LTSC2021
title Inplace-Upgrade ^| LTSC 2021 - Installation
cd /d "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC21"
start "" setup.exe /auto upgrade /showoobe none
goto :end

::Subroutinen (Kopieren)
::----------------------

:Copy-All
call :Copy-LTSC2019
cls
call :Copy-LTSC2021
goto :eof

:Copy-LTSC2019
title Inplace-Upgrade ^| LTSC 2019 - Kopieren
cd /d "%~dp0\_Dateien\LTSC19"
IF EXIST "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC19" rd /S /Q "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC19"
robocopy . "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC19" /E /NJH /NJS
goto :eof

:Copy-LTSC2021
title Inplace-Upgrade ^| LTSC 2021 - Kopieren
cd /d "%~dp0\_Dateien\LTSC21"
IF EXIST "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC21" rd /S /Q "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC21"
robocopy . "%USERPROFILE%\Desktop\Inplace-Upgrade\LTSC21" /E /NJH /NJS
goto :eof


::Meldungen/Fehler
::----------------

:Aktuell
title Inplace-Upgrade ^| Aktuell
echo Windows ist bereits auf LTSC 2021
echo.
pause
goto :end

:CheckError
title Inplace-Upgrade ^| CheckError
echo Betriebssystemversion konnte nicht bestimmt werden!
echo Bitte an Skriptersteller wenden.
echo.
pause
goto :end

:noAdmin
title Inplace-Upgrade ^| checkAdmin - Fehler
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
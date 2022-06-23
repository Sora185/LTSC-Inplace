@echo off
title webclient.bat
mode con cols=75 lines=10
sc config "WebClient" start=auto
net start "WebClient"
exit
@echo off
title enable_rdp.bat
mode con cols=50 lines=10
netsh advfirewall firewall set rule name="Remotedesktop - Benutzermodus (TCP eingehend)" new enable=yes
netsh advfirewall firewall set rule name="Remotedesktop - Benutzermodus (UDP eingehend)" new enable=yes
exit
# Vorbereitung
## Windows Installationsdateien

In den Ordnern <i>"_Dateien\LTSC19"</i> und <i>"_Dateien\LTSC21"</i> müssen die Dateien aus den jeweiligen Windows ISOs hineinkopiert werden. Alternativ das Installationsskript anpassen und die eigenen gewünschten Windows Versionen verwenden.

# Aufbau
<b><ins>! Die Skripte müssen alle jeweils als Admin gestartet werden !</ins></b>

| Dateiname/Pfad | Beschreibung |
| --------------- | ------------ |
| Inplace-Upgrade.bat | Das eigentliche Skript des automatisierten Upgrades. Ermittelt die aktuelle Windows-Version und kopiert die benötigten Dateien für das Upgrade auf den Client |
| manuelles-inplace\ | Skripte für das einzelne manuelle Starten des Inplace-Upgrades von entweder LTSC 2019 oder LTSC 2021 |
| Cleaner_link.bat | Startet die Datei <i>"_Dateien\Cleaner\Cleaner.bat"</i> |
| _Dateien\Cleaner\Cleaner.bat | Startet die Skripte unter <i>"_Dateien\Cleaner\helper\"</i> |
| _Dateien\Cleaner\helper\ | Beinhaltet die Skripte zur Setzung und anschließender Löschung der benötigten Registry-Keys der Datenträgerbereinigung, Löschung der Installationsdateien und zur Konfiguration (Start nach Hochfahren) und direktem Starten des Dienstes "WebClient" |
| _Dateien\LTSC19\ | Beinhaltet die Installationsdateien von Windows (müssen nachträglich eingefügt werden, da pro OS ~4GB) |
| _Dateien\LTSC19\trigger_upgrade.bat | Beinhaltet das Skript fürs manuelle Starten des Upgrades der jeweiligen Windows-Version |
| _Dateien\LTSC21\ | Beinhaltet die Installationsdateien von Windows (müssen nachträglich eingefügt werden, da pro OS ~4GB) |
| _Dateien\LTSC21\trigger_upgrade.bat | Skript fürs manuelle Starten des Upgrades der jeweiligen Windows-Version |

# Verwendung
Den kompletten "LTSC-Inplace" Ordner (Name kann geändert werden) auf einen USB Stick ziehen und von dort aus das Skript "Inplace-Upgrade.bat" als Admin starten. Das Skript erkennt automatisch, ob aktuell LTSB 2016, LTSC 2019 oder LTSC 2021 installiert ist. Sollte LTSC 2021 installiert wird lediglich gemeldet, dass bereits LTSC 2021 installiert ist. </br>
Ist aktuell LTSB 2016 installiert wird zunächst gefragt, ob auch gleich die Installationsdateien von LTSC 2021 auf den Client kopiert werden sollen. Wenn ja, wird LTSC 2019 und LTSC 2021 kopiert. (LTSC 2021 direkt zu Kopieren spart nach der Installation von LTSC 2019 Zeit, da nicht noch erst die Daten von LTSC 2021 kopiert werden müssen.)</br>
Ist aktuell LTSC 2019 installiert, werden nur die Installationsdateien von LTSC 2021 kopiert.</br>
Ab diesem Punkt startet der Kopiervorgang (Zielpfad=<aktuell angemeldeter Benutzer>\Desktop\Inplace-Upgrade\LTSC{19/21}) und daraufhin jeweils die Installation von LTSC 2019. Das kann je nach Geschwindigkeit des Rechners 1-4 Stunden dauern.</br>
</br>
Nach der Installation sollte noch das Cleaner-Skript gestartet werden. Dafür einfach die Datei "Cleaner_link.bat" (als Admin) starten und durchlaufen lassen.

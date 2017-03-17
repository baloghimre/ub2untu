#!/bin/bash

clear
echo
echo "\033[1m I. RENDSZERFRISSÍTÉS\033[0m"
echo

#CSOMAGLISTÁK FRISSÍTÉSE ÚJ

echo "Csomaglisták frissítése..."
hiba="$(sudo apt-get update 2>&1 > /dev/null)"
echo $hiba
if [$hiba = ""]; then
echo "A frissítés sikeres."
echo "$(date) - Csomagtárolók frissítése sikeres." >> install.log
else
echo "\33[31mSIKERTELEN FRISSÍTÉS. Ellenőrizze az internetkapcsolatot, majd futtassa újra a telepítőt!\33[0m"
echo "$(date) - Csomagtárolók frissítése sikertelen." >> install.log
fi

# OPERÁCIÓS RENDSZER FRISSÍTÉSE

echo "Csomaglisták frissítése..."
hiba="$(sudo apt-get upgrade 2>&1 > /dev/null)"
echo $hiba
if [$hiba = ""]; then
echo "A frissítés sikeres."
echo "$(date) - Az operációs rendszer frissítése sikeres." >> install.log
else
echo "\33[31mSIKERTELEN FRISSÍTÉS. Ellenőrizze az internetkapcsolatot, majd futtassa újra a telepítőt!\33[0m"
echo "$(date) - Az operációs rendszer frissítése sikertelen." >> install.log
fi

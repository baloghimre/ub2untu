#!/bin/bash

clear
echo
echo "\033[1m I. RENDSZERFRISSÍTÉS\033[0m"
echo


# CSOMAGLISTÁK FRISSÍTÉSE

hiba=0

echo "Csomaglisták frissítése..."
hiba=$( sudo apt-get update | grep -c 'hiba' )

if [ "$hiba" -eq 0 ] ; then
echo "A frissítés sikeres."
echo "$(date) - Csomagtárolók frissítése sikeres." >> install.log
else
echo "\33[31mSIKERTELEN FRISSÍTÉS. Ellenőrizze az internetkapcsolatot, majd futtassa újra a telepítőt! A telepítő kilép.\33[0m"
echo "$(date) - Csomagtárolók frissítése sikertelen." >> install.log
exit
fi






# OPERÁCIÓS RENDSZER FRISSÍTÉSE

hiba=0

echo "Operációs rendszer fájljainak frissítése... (hosszú ideig tarthat)"
hiba=$( sudo apt-get update | grep -c 'hiba' )

if [ "$hiba" -eq 0 ] ; then
echo "A frissítés sikeres."
echo "$(date) - A rendszer frissítése sikeres." >> install.log
else
echo "\33[31mSIKERTELEN RENDSZERFRISSÍTÉS. Ellenőrizze az internetkapcsolatot, majd futtassa újra a telepítőt! A telepítő kilép.\33[0m"
echo "$(date) - A rendszer frissítése sikertelen." >> install.log
exit
fi

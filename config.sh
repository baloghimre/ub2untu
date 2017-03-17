#!/bin/bash

clear
echo
echo "\033[1m III. RENDSZERKONFIGURÁCIÓ\033[0m"
echo
echo $1 "felhasználó hozzáadása"
sudo adduser $1

echo "RENDSZER mappa létrehozása és jogosultságok beállítása"

sudo mkdir /rendszer

chmod 751 /rendszer

# scriptek másolása








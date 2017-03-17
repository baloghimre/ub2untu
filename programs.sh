#!/bin/bash

clear
echo
echo "\033[1m II. PROGRAMOK TELEPÍTÉSE\033[0m"
echo

# Kérdezze meg, hogy tanári vagy tanulói számítógép.
# programok-tanulo.txt vagy programok-tanar.txt (utóbbi esetében tegye fel a lubuntu-desktop csomagot is!)
# a választást mentse egy "felhasznalo" nevű fájlba (tartalma: tanulo vagy tanari) - később a felhasználók
# létrehozásánál szükségünk lesz rá. (következő script)



# tanulo
while read line; do    
    echo "A(z) "$line" program telepítése..."
    sudo apt-get -y install $line 2> install.log
done < programok-tanulo.txt

# tanari
while read line; do    
    echo "A(z) "$line" program telepítése..."
    sudo apt-get -y install $line 2> install.log
done < programok-tanulo.txt

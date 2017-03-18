#!/bin/bash
TIP=""
clear
echo
echo "\033[33m II. PROGRAMOK TELEPÍTÉSE\033[0m"
echo

# Kérdezze meg, hogy tanári vagy tanulói számítógép.
# programok-tanulo.txt vagy programok-tanar.txt (utóbbi esetében tegye fel a lubuntu-desktop csomagot is!)
# a választást mentse egy "user" nevű fájlba (tartalma: tanulo vagy tanari) - később a felhasználók
# létrehozásánál szükségünk lesz rá. (következő script)


echo "Kérem a telepítési módót! 0/1"
echo "0 : Diák"
echo "1 : Tanár"
read TIP
echo -n "Kiválasztott telepítésí mód : "
echo $TIP


if [ $TIP = "1" ]; then

while read line; do    
    echo "A(z) "$line" program telepítése..."
    sudo apt-get -y install $line 2>> install.log > /dev/null;
    #stderr vizsgálata!!
    echo "$(date) - $line program sikeresen telepítve."
    
done < programok-tanari.txt
	
else

while read line; do    
    echo "A(z) "$line" program telepítése..."
    sudo apt-get -y install $line 2>> install.log > /dev/null;
done < programok-tanulo.txt

fi

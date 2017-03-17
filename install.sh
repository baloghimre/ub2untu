#!/bin/bash

clear
echo ""
echo "  ██╗   ██╗██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗"
echo "  ██║   ██║██╔══██╗╚════██╗██║   ██║████╗  ██║╚══██╔══╝██║   ██║"
echo "  ██║   ██║██████╔╝ █████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║"
echo "  ██║   ██║██╔══██╗██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║"
echo "  ╚██████╔╝██████╔╝███████╗╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝"
echo "   ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ "
echo ""                                                              
echo "  ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗             "
echo "  ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║             "
echo "  ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║             "
echo "  ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║             "
echo "  ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗        "
echo "  ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝        "
echo "                                                              "
echo "  ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗                  "
echo "  ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝                  "
echo "  ███████╗██║     ██████╔╝██║██████╔╝   ██║                     "
echo "  ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║                     "
echo "  ███████║╚██████╗██║  ██║██║██║        ██║                     "
echo "  ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝         "
echo ""
echo "                        Pink Monkey"
echo ""
echo "            A telepítés azonnal elindul..."



sleep 2
#megkérdezi hogy el akarjuk inditani e a telepitést igen/nem 
#igen update.sh 
#nem kilép

read -r -p "${1:-Biztos vagy benne hogy elinditod a telepitést? [y/N]} " response
case "$response" in
[yY][eE][sS]|[yY]) 
    	echo "a telepito most elindul"
	echo "$(date) - Telepítés megkezdése." > install.log
	./update.sh
    ;;
*)
    	echo "$(date) - Telepítés megszakitása:install.sh-ban." > install.log
	echo "a telepitő most kilep"
    ;;
esac





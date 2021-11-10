#!/bin/bash
echo ""
echo "============="
echo "This script need root privileges. please coinform password. or kill script and run as a root:"
sudo echo "sudo coinform"
clear
echo "WELCOME TO UNNOFICIAL SAMSUNG PRINTER DRIVERS INSTALLER"
echo -e '\e]8;;https://github.com/fbrzostowski\aurl to my git hub:\e]8;;\a' 
echo "project written in bash."
echo "Project under gpl v3 licence. free as in freedom"
echo "This script helps you with th installing samsung printer drivers and adding your printer"
echo "Do you want to continue?"
read -p "[y/n]:"
if [ $answer == "n" ]
then
	exit
fi
clear
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR
tar -xf uld.tar.xz
sudo sh $SCRIPT_DIR/uld/install.sh
sudo sh $SCRIPT_DIR/uld/install-printer.sh
clear
echo "select your package manager:"
echo "1) pacman"
echo "2) apt"
echo "3) dnf"
echo "4) other"
read -p [$USER]: pkgman
if [ $pkgman == "1" ]
then
	sudo pacman -S system-config-printer
fi

if [ $pkgman == "2" ]; then
	sudo apt-get install system-config-printer
fi

if [ $pkgman == "3" ]; then
	sudo dnf install system-config-printer
fi

if [ $pkgman == "4" ]; then
	echo "install package: system-config-printer"
	bash
fi
clear
echo "now add your printer"
read -p [return] skip
system-config-printer
exit

#!/bin/bash

#======================================================================#
#	 __     ___  __      __   __   __   ___  __  
#	|__) | |__  |__)    /  ` /  \ |  \ |__  |__) 
#	|    | |___ |  \    \__, \__/ |__/ |___ |  \ 
#	
#	my debian post installation script                                             
#======================================================================#

# It's easier to start with a debian XFCE installation

echo ""
echo '+==================================================+'
echo '|     __   ___  __               __                |' 
echo '|    |  \ |__  |__) |  /\  |\ | |__)               |' 
echo '|    |__/ |___ |__) | /~~\ | \| |                  |'
echo '|                                                  |'
echo '+==================================================+'

echo ""
echo "------------------------"
echo "1 - Upgrading the system"
echo "------------------------"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list
echo "< Sources list updated >"

echo ""
sudo apt update && sudo apt full-upgrade && sudo apt autoremove
sudo apt purge $(dpkg -l | grep "^rc" | awk '{print $2}')
sudo apt autoremove
echo "< System updated >"

echo ""
echo "--------------------------------------"
echo "2 - Installing the desktop environment"
echo "--------------------------------------"
sudo apt install i3 feh picom kitty fonts-font-awesome lxappearance gtk2-engines-murrine slick-greeter lightdm-settings
echo "< Desktop environment installed >"

echo ""
echo "----------------------------------"
echo "3 - Installing additional packages"
echo "----------------------------------"
sudo apt install thunar gvfs-backends gvfs-fuse geany geany-common wget 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt install ./google-chrome-stable*
echo "< Additional packages installed >"

echo ""
echo "-------------------------"
echo "4- Configuring the system"
echo "-------------------------"
cp -r .wallpapers ~
cp -r .themes ~
cp -r .config ~
cp .bashrc ~
echo "< System configured >"

echo ""
echo "< All is done. Reboot your system. >"

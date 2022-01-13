#!/bin/bash

# Start with a debian server installation (only the basic system installation)

echo "======================================="
echo "This will istall DebianP on your system"
echo "======================================="

echo ""
echo "--------------------------------"
echo "1 - Changing the repository list"
echo "--------------------------------"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list

echo ""
echo "-------------------------"
echo "2 - Upgrading your system"
echo "-------------------------"
sudo apt update && sudo apt full-upgrade && sudo apt autoremove

echo ""
echo "--------------------------------------"
echo "3 - Installing the desktop environment"
echo "--------------------------------------"
sudo apt install xfce4 xfce4-goodies papirus-icon-theme slick-greeter gobject-introspection gir1.2-gtk-3.0 lightdm-settings -y

echo ""
echo "-----------------------------"
echo "4 - Installing extra software"
echo "-----------------------------"
sudo apt install firefox-esr command-not-found mc neofetch cmatrix inxi flatpak htop -y

echo ""
echo "-------------------------"
echo "5- Configuring the system"
echo "-------------------------"
#TBD
# GRUB
# FLATPAK
# APPARANCE
# SHORTCUTS


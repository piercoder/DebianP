#!/bin/bash

# Start with a debian basic installation

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
sudo apt purge $(dpkg -l | grep "^rc" | awk '{print $2}')

echo ""
echo "--------------------------------------"
echo "3 - Installing the desktop environment"
echo "--------------------------------------"
sudo apt install xfce4 xfce4-goodies \
				gnome-themes-extra papirus-icon-theme \
				slick-greeter gobject-introspection gir1.2-gtk-3.0 lightdm-settings

echo ""
echo "-----------------------------"
echo "4 - Installing extra software"
echo "-----------------------------"
sudo apt install firefox-esr geany geany-common synaptic flatpak \
				command-not-found mc htop neofetch cmatrix

echo ""
echo "-------------------------"
echo "5- Configuring the system"
echo "-------------------------"
mkdir -p ~/bin ~/.wallpapers
mv wallpaper.jpg ~/.wallpapers
#TBD
# GRUB
# FLATPAK
# APPARANCE
# SHORTCUTS


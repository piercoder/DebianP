#!/bin/bash

# Start with a debian basic installation

echo ""
echo '+==================================================+'
echo '| mmmm          #        "                  mmmmm  |'
echo '| #   "m  mmm   #mmm   mmm     mmm   m mm   #   "# |'
echo '| #    # #"  #  #" "#    #    "   #  #"  #  #mmm#" |'
echo '| #    # #""""  #   #    #    m"""#  #   #  #      |'
echo '| #mmm"  "#mm"  ##m#"  mm#mm  "mm"#  #   #  #      |'
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
sudo apt install xfce4 xfce4-goodies \
				gnome-themes-extra papirus-icon-theme \
				slick-greeter gobject-introspection gir1.2-gtk-3.0 lightdm-settings
echo "< Desktop environment installed >"

echo ""
echo "----------------------------------"
echo "3 - Installing additional packages"
echo "----------------------------------"
sudo apt install firefox-esr geany geany-common synaptic flatpak \
				command-not-found mc htop neofetch cmatrix
sudo apt update
echo "< Additional packages installed >"

echo ""
echo "-------------------------"
echo "4- Configuring the system"
echo "-------------------------"
mkdir -p ~/bin ~/.wallpapers
cp wallpaper.jpg ~/.wallpapers
echo "TO BE DONE"
echo "< System configured >"

echo ""
echo "< All is done. Reboot your system. >"


#TBD
# GRUB
# FLATPAK
# APPARANCE
# SHORTCUTS


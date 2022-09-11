#!/bin/bash

#======================================================================#
#    __     ___  __      __   __   __   ___  __
#   |__) | |__  |__)    /  ` /  \ |  \ |__  |__)
#   |    | |___ |  \    \__, \__/ |__/ |___ |  \
#
#   My minimal debian post installation script.
#   Install packages after installing base Debian with no GUI.
#   Or after installing a base Debian XFCE installation.
#======================================================================#

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
## if you started from the xfce installation, uninstall unneeded packages to use alternatives instead
echo ""
sudo apt purge -y xfce4-goodies xfce4-notifyd xfce4-terminal xsane parole cups*
sudo apt purge -y libreoffice* firefox-esr* exfalso gimp* mousepad ristretto sane*  
sudo apt purge -y gnome-accessibility-themes lynx* synaptic vim* 
sudo apt autoremove -y
sudo apt purge -y $(dpkg -l | grep "^rc" | awk '{print $2}')
sudo apt autoremove -y
echo "< Unneded packages uninstalled >"

echo ""
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list
echo "< Sources list updated >"

echo ""
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
sudo apt purge -y $(dpkg -l | grep "^rc" | awk '{print $2}')
sudo apt autoremove -y
echo "< System upgraded >"

echo ""
echo "< System updated >"

echo ""
echo "--------------------------------------"
echo "2 - Installing the desktop environment"
echo "--------------------------------------"
echo ""
sudo apt install -y man wget
echo "< System utitlities installed >"

# Microcode for AMD/Intel
# echo ""
# sudo apt install -y amd64-microcode
# sudo apt install -y intel-microcode
# echo "< Microcode installed>"

echo ""
sudo apt install -y i3
echo "< Window manager installed >"

echo ""
sudo apt install -y feh picom lxappearance fonts-font-awesome
echo "< Window manager ricing packages installed >"

echo ""
sudo apt install -y lightdm slick-greeter lightdm-settings
echo "< Display manager installed >"

echo ""
sudo apt install -y pulseaudio alsa-utils pavucontrol
echo "< Audio packages installed >"

echo ""
sudo apt install -y dunst libnotify-bin
echo "< Notification packages installed >"

echo ""
sudo apt install -y flameshot diodon network-manager-gnome pasystray
echo "< System-tray applets installed >"

echo ""
sudo apt install -y xfce4-power-manager
echo "< Power manager installed >"

echo ""
sudo apt install -y kitty
echo "< Terminal installed >"

echo ""
sudo apt install -y thunar gvfs-backends gvfs-fuse
echo "< File manager installed >"

echo ""
sudo apt install -y geany geany-common
echo "< Text editor installed >"

echo ""
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable*
rm google-chrome-stable*
echo "< Browser installed >"

echo ""
sudo apt install -y gtk2-engines-murrine
echo "< Additional packages installed >"

echo ""
echo "< Desktop environment installed >"

echo ""
echo "--------------------------"
echo "3 - Configuring the system"
echo "--------------------------"
echo ""
git clone https://gitlab.com/dwt1/wallpapers.git
mv wallpapers ~/.wallpapers
echo "< Wallpapers installed >"

echo ""
mkdir .themes
cd .themes
git clone https://github.com/dracula/gtk
cd ..
mv .themes ~/.themes
echo "< GTK theme installed >"

echo ""
mkdir -p ~/.config/
ln -s ~/DebianP/.config/* ~/.config/
ln -s ~/DebianP/.config/.picom.conf ~/.config/
rm ~/.bashrc
ln -s ~/DebianP/.bashrc ~/
echo "< Configuration files copied >"

echo ""
mkdir buffer
cd buffer
git clone https://github.com/geany/geany-themes
mkdir -p ~/.config/geany/colorschemes/
mv geany-themes/colorschemes/*.conf ~/.config/geany/colorschemes/ 
cd ..
rm -rf buffer
echo "< Geany themes installed >"

echo ""
sudo apt autoremove -y
sudo apt purge -y $(dpkg -l | grep "^rc" | awk '{print $2}')
sudo apt autoremove -y
echo "< System configured >"
echo "$(dpkg -l | grep -c ^ii) packages installed on your system"

echo ""
echo "< All is done. Reboot your system. >"

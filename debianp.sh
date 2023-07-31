#!/bin/bash

#======================================================================#
#    __     ___  __      __   __   __   ___  __
#   |__) | |__  |__)    /  ` /  \ |  \ |__  |__)
#   |    | |___ |  \    \__, \__/ |__/ |___ |  \
#
#   My Debian i3 post installation script.
#   Run after a minimal install.
#======================================================================#

#----------------------------------------------------------------------#
# Functions
#----------------------------------------------------------------------#
clean()
{
  sudo apt autoremove -y
  sudo apt purge -y $(dpkg -l | grep "^rc" | awk '{print $2}')
  sudo apt autoremove -y
}

update()
{
sudo apt update
sudo apt full-upgrade -y
 sudo apt autoremove -y
}
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
# Installation
#----------------------------------------------------------------------#
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
echo ""
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list
echo "< Sources list updated >"

echo ""
update
echo "< System upgraded >"

echo ""
echo "< System updated >"

echo ""
echo "--------------------------------------"
echo "2 - Installing the desktop environment"
echo "--------------------------------------"
echo ""
sudo apt install -y man wget curl neofetch deborphan command-not-found tldr \
    htop xdotool jq bat exa nala gpm unzip

echo "< System utitlities installed >"

# Microcode for AMD/Intel
echo ""
# sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode
echo "< Microcode installed>"

# Nvidia drivers
# echo ""
# sudo apt install -y nvidia-driver
# echo "< Nvidia drivers installed >"

echo ""
sudo apt install -y i3
echo "< Window manager installed >"

echo ""
sudo apt install -y feh picom lxappearance
echo "< Window manager utils installed >"

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
sudo apt install -y xfce4-power-manager cbatticon
echo "< Power manager installed >"

echo ""
sudo apt install -y kitty
echo "< Terminal installed >"

echo ""
sudo apt install -y thunar gvfs-backends gvfs-fuse
echo "< File manager installed >"

echo ""
sudo apt install -y vim geany geany-common geany-plugin-git-changebar geany-plugin-spellcheck
echo "< Text editor installed >"

echo ""
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./chrome.deb
rm chrome.deb
echo "< Browser installed >"

echo ""
sudo apt install -y ristretto parole atril atril-common thunderbird
echo "< Utilities installed >"

echo ""
echo "< Desktop environment installed >"

echo ""
echo "--------------------------------------"
echo "3 - Configuring the system and theming"
echo "--------------------------------------"

echo ""
sudo apt install -y gnome-themes-extra adwaita-icon-theme fonts-font-awesome gtk2-engines-murrine
echo "< Fonts and GTK theme installed >"

echo ""
mkdir -p ~/.wallpapers
cp bg.jpg ~/.wallpapers
echo "< Wallpapers installed >"

echo ""
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
mkdir -p ~/.local/share/fonts
mv FiraCode.zip  ~/.local/share/fonts
cd ~/.local/share/fonts
unzip FiraCode.zip
cd ~/DebianP/

echo ""
curl -sS https://starship.rs/install.sh | sh
echo "< Starship prompt installed >"

echo ""
mkdir -p ~/.config/
ln -sf ~/DebianP/.config/* ~/.config/
ln -sf ~/DebianP/.config/.picom.conf ~/.config/
ln -sf ~/DebianP/.vimrc ~/
rm ~/.bashrc
ln -sf ~/DebianP/.bashrc ~/
echo "< Configuration files copied >"

echo ""
mkdir geanythemes
cd geanythemes
git clone https://github.com/geany/geany-themes
mkdir -p ~/.config/geany/colorschemes/
mv geany-themes/colorschemes/*.conf ~/.config/geany/colorschemes/
cd ..
rm -rf geanythemes
echo "< Geany themes installed >"

echo ""
clean
echo "< System configured >"

echo ""
echo "$(dpkg -l | grep -c ^ii) packages installed on your system"

echo ""
echo "< All is done. Reboot your system. >"

#!/bin/bash

#======================================================================#
#	 __     ___  __      __   __   __   ___  __
#	|__) | |__  |__)    /  ` /  \ |  \ |__  |__)
#	|    | |___ |  \    \__, \__/ |__/ |___ |  \
#
#	Add additional packages
#======================================================================#

# DEB Onlyoffice: https://www.onlyoffice.com/it/download-desktop.aspx
# DEB teams: https://www.microsoft.com/en-us/microsoft-teams/download-app#desktopAppDownloadregion
# DEB dropbox: 

#----------------------------------------------------------------------#
# Install NIX package manager
#----------------------------------------------------------------------#
# curl -L https://nixos.org/nix/install | sh
# mkdir ~/.config/nixpkgs
# echo '{ allowUnfree = true; }' > ~/.config/nixpkgs/config.nix
# source ~/.nix-profile/etc/profile.d/nix.sh
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
# Install flatpak
#----------------------------------------------------------------------#
# echo ""
# sudo apt install -y flatpak
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
# Install packages
#----------------------------------------------------------------------#
# nix-env -iA PKG_NAME
# flatpak -y install flathub PKG_NAME_ON_FLATHUB
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
# Virtual manager
#----------------------------------------------------------------------#
# sudo apt install virt-manager
# sudo usermod -a -G libvirt $(whoami)
#----------------------------------------------------------------------#

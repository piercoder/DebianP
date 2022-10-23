#!/bin/bash

#======================================================================#
#	 __     ___  __      __   __   __   ___  __
#	|__) | |__  |__)    /  ` /  \ |  \ |__  |__)
#	|    | |___ |  \    \__, \__/ |__/ |___ |  \
#
#	Add additional packages
#======================================================================#

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
# nix-env -iA nixpkgs.teams nixpkgs.onlyoffice-bin
# flatpak -y install flathub com.dropbox.Client
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
# Virtual manager
#----------------------------------------------------------------------#
# sudo apt install virt-manager
# sudo usermod -a -G libvirt $(whoami)
#----------------------------------------------------------------------#

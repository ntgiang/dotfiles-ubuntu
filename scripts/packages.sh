#!/bin/bash

#
# Install all packages from repository
#

add-apt-repository -y ppa:webupd8team/terminix
add-apt-repository -y ppa:snwh/pulp
add-apt-repository -y ppa:tista/adapta
add-apt-repository -y ppa:atareao/atareao

#
# Repository stuff
#

# Enable Universe repro
add-apt-repository -y universe

# Enable TLP
add-apt-repository -y ppa:linrunner/tlp

# Update and upgrade
apt-get update
apt-get -y upgrade

# ZSH
apt -y install zsh

# Transmission
apt -y install transmission

# VLC
apt -y install vlc

# Tmux
apt -y install tmux

# Clipit
apt -y install clipit

# Shutter
apt -y install shutter

# Virtualbox
apt -y install virtualbox

# Corebird
apt -y install corebird

# S3cmd
apt -y install s3cmd

# Ctags
apt -y install exuberant-ctags

# For Deja-dup to enable cloud storage options
apt -y install python-boto
apt -y install python-cloudfiles

# Preload memorizes apps we open most
apt -y install preload

# Get compiz setting manager
apt -y install compizconfig-settings-manager

# Install TLP
apt -y install tlp tlp-rdw
apt -y install smartmontools ethtool
apt -y install tp-smapi-dkms
tlp start

# Let's be able to mount exfat
apt -y install exfat-fuse exfat-utils

# 7zip
apt -y install p7zip-full

# Terminator
apt -y install terminator

# Printer drivers
apt -y install openprinting-gutenprint

# NTP
apt -y install ntp
service ntp restart

# Font Awesome
apt -y install fonts-font-awesome

# DNS masq
#apt -y install dnsmasq
#systemctl restart dnsmasq

# Terminix
apt -y install terminix

# Gnome stuff
apt -y install gnome-tweak-tool gnome-shell-extensions

# Themes

# Adapta
apt -y install adapta-gtk-theme

# Paper icons
apt -y install paper-icon-theme

# Touchpad
apt -y install touchpad-indicator

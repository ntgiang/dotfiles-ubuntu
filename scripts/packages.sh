#!/bin/bash

#
# Install all packages from repository
#

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
apt -y openprinting-gutenprint

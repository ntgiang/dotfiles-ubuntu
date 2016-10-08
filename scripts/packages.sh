#!/bin/bash

#
# Install all packages from repository
#

#
# Repository stuff
#

# Enable Universe repro
add-apt-repository -y universe

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

# Smartmontools
apt -y install smartmontools

# Ctags
apt -y install exuberant-ctags

# For Deja-dup to enable cloud storage options
apt -y install python-boto
apt -y install python-cloudfiles

# Preload memorizes apps we open most
apt -y install preload

# Get compiz setting manager
apt -y install compizconfig-settings-manager
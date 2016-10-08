#!/bin/bash
#
# Script for installing all kinds of stuff on Ubuntu
#
# -------------------------------------------
# make sure to run this script with sudo !!!!
# -------------------------------------------
#


# Where are we?
scriptDir=${PWD}

# Repository stuff
./scripts/packages.sh

# Downloading apps
echo 'Downloading and installing app...'
./scripts/remote.sh

# Atom
echo 'Installing Atom and packages'
./scripts/atom.sh

# FFmpeg
echo 'Installing ffmpeg'
./scripts/ffmpeg.sh

# NVM and node
echo 'Installing node'
./scripts/node.sh

# Disable autostart of MySQL
service mysql stop
update-rc.d mysql disable

# Disable autostart of MongoDB
service mongodb stop
update-rc.d mongodb disable

# Disable autostart of ElasticSearch
service elasticsearch stop
update-rc.d elasticsearch disable
systemctl disable elasticsearch.service

## Configure stuff
echo 'Configuring things...'

# Create local repository directory
mkdir -p "$HOME/Documents/repos"
# Change owner
chown -r $USER "$HOME/Documents/repos"

# Link ZSH config
rm -f "$HOME/.zshrc"
rm -f "$HOME/.zshrc.d"
ln -s "$scriptDir/ohmyzsh/.zshrc" "$HOME/."
ln -s "$scriptDir/ohmyzsh/.zshrc.d" "$HOME/."

# Link vimrc
rm -f "$HOME/.vimrc"
ln -s "$scriptDir/vim/.vimrc" "$HOME/."

# Link gitconfig
rm -f "$HOME/.gitconfig"
ln -s "$scriptDir/gitconfig" "$HOME/.gitconfig"

# Add kernel optimization
cp -pr "$scriptDir/kernel-tuning.conf" /etc/sysctl.d/99-tuning.conf
# Load it into the kernel
sysctl -p

echo 'All done. Switching to ZSH...'

# All done. Switch shell
chsh -s /bin/zsh

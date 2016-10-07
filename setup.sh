#!/bin/bash
#
# Script for installing all kinds of stuff on Ubuntu
#
# -------------------------------------------
# make sure to run this script with sudo !!!!
# -------------------------------------------
#
#

# Where are we?
scriptDir=${PWD}

#
# Repository stuff
#

# Enable Universe repro
add-apt-repository -y universe

# Add the Oracle repro
apt-get -y install software-properties-common
apt-add-repository -y ppa:webupd8team/java

# Add Zeal
add-apt-repository -y ppa:zeal-developers/ppa

# Add MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.3 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# Add Elasticsearch
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

# Update and upgrade
apt-get update
apt-get -y upgrade

# Install git
apt -y install git


#
# Installing remote apps
#

# Create local repository directory
mkdir -p "$HOME/Documents/repos"
# Change owner
chown -r $USER "$HOME/Documents/repos"

# Downloading apps
echo 'Downloading and installing app...'

# Installing ZSH
echo 'Installing ZSH Shell...'
cd "$HOME/Downloads"
apt -y install zsh
wget "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

# Install Atom
echo 'Installing Atom'
cd "$HOME/Downloads"
wget "https://github.com/atom/atom/releases/download/v1.10.2/atom-amd64.deb"
dpkg -i atom-amd64.deb

# Install Simplenote
echo 'Installing Simplenote'
cd "$HOME/Downloads"
wget "https://github.com/Automattic/simplenote-electron/releases/download/v1.0.3/simplenote-1.0.3.deb"
dpkg -i simplenote-1.0.3.deb

# Install Mongochef
echo 'Installing Mongochef'
cd "$HOME/Downloads"
wget "https://cdn.3t.io/mongochef-core/linux/4.3.0/mongochef-linux-x64-dist.tar.gz"
tar -xvzf mongochef-linux-x64-dist.tar.gz
 Create shortcut for mongochef

# Install Smartgit
echo 'Installing Smartgit'
cd "$HOME/Downloads"
wget "http://www.syntevo.com/static/smart/download/smartgit/smartgit-8_0_2.deb"
dpkg -i smartgit-8_0_2.deb

# Download and install Exiftool
echo "Installing Exiftool"
cd "$HOME/Downloads"
wget "http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.29.tar.gz"
tar xzvf Image-ExifTool-10.29.tar.gz
cd Image-ExifTool-10.29
perl Makefile.PL
make test
make install

#
# Apps in repos
#

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

# Zeal
apt -y install zeal

# Corebird
apt -y install corebird


#
# Dev stuff
#

# Python
apt -y install python python-pip

# S3cmd
apt -y install s3cmd

# Smartmontools
apt -y install smartmontools

# Java
apt -y install oracle-java8-installer

# Imagemagick
apt -y install imagemagick

# Dcraw and ufraw
apt -y install dcraw
apt -y install ufraw

# Mp4Box (gpac)
apt -y install gpac

# MySQL
apt -y install mysql-server mysql-client

# MongoDB
apt -y install mongodb

# ElasticSearch
apt -y install elasticsearch

# Ctags
apt -y install exuberant-ctags

# FFmpeg
echo 'Installing ffmpeg'

# NVM
cd "$HOME/Downloads"
sudo -s wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash


# For Deja-dup to enable cloud storage options
apt -y install python-boto
apt -y install python-cloudfiles

# Preload memorizes apps we open most
apt -y install preload


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

# Get compiz setting manager
apt -y install compizconfig-settings-manager

# Link ZSH config
rm -f "$HOME/.zshrc"
rm -f "$HOME/.zshrc.d"
ln -s "$scriptDir/ohmyzsh/.zshrc" "$HOME/."
ln -s "$scriptDir/ohmyzsh/.zshrc.d" "$HOME/."

# Link vimrc
ln -s "$scriptDir/vim/.vimrc" "$HOME/."

# Add kernel optimization
cp -pr "$scriptDir/kernel-tuning.conf" /etc/sysctl.d/99-tuning.conf
# Load it into the kernel
sysctl -p

# Install powerline
echo 'Powerline stuff'
sudo -H pip install git+git://github.com/Lokaltog/powerline
cd "$HOME/Downloads"
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# Install node
nvm install 6
nvm alias node 6
nvm alias default 6
npm -g install node-dev
npm -g install mocha


echo 'All done. Switching to ZSH...'

# All done. Switch shell
chsh -s /bin/zsh



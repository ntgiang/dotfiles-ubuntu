#!/bin/bash

#
# Fetches remote apps and installs them
#

# Installing ZSH
echo 'Installing ZSH Shell...'
cd "$HOME/Downloads"
wget "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

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

# Install powerline
echo 'Powerline stuff'
sudo -H pip install git+git://github.com/Lokaltog/powerline
cd "$HOME/Downloads"
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

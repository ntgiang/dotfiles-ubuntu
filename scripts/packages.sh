#!/bin/bash

#
# Install all packages from repository
#

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

# For Deja-dup to enable cloud storage options
apt -y install python-boto
apt -y install python-cloudfiles

# Preload memorizes apps we open most
apt -y install preload

# Get compiz setting manager
apt -y install compizconfig-settings-manager

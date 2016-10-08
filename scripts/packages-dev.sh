#!/bin/bash

#
# Install all packages from repository for development
#

#
# Repository stuff
#

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

# Zeal
apt -y install zeal

# Python
apt -y install python python-pip

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

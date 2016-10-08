#!/bin/bash

#
# Install nvm and node and global packages
#

echo 'Installing nvm and node'

# NVM
cd "$HOME/Downloads"
sudo -s wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash

# Install node
nvm install 6
nvm alias node 6
nvm alias default 6
npm -g install node-dev
npm -g install mocha

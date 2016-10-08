#!/bin/bash

#
# Installs everything Atom related
#

echo 'Installing Atom and packages'

# Install Atom
cd "$HOME/Downloads"
wget "https://github.com/atom/atom/releases/download/v1.10.2/atom-amd64.deb"
dpkg -i atom-amd64.deb

# Install Packages
apm install project-manager
apm install language-cfml
apm install linter-cflint
apm install linter
apm install autocomplete-paths
apm install atom-jade
apm install HTML2jade-plus
apm install color-picker
apm install linter-jshint
apm install linter-csslint
apm install linter-xmllint
apm install linter-jsonlint
apm install highlight-line
apm install merge-conflicts
apm install isotope-ui
apm install save-session
apm install git-time-machine
apm install atom-beautify
apm install file-icons

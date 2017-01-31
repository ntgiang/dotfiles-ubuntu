# Scripts and dotfiles for Ubuntu

Setup script and dotfiles for a new Ubuntu installation. This was created for Ubuntu 16.04 and I will continue to update them as needed.

## What it does

The scripts will setup a complete desktop with the most used (for me) applications and configure the system. Manual interactions are listed in the "Tweaks" section below.

## How to use it

Simply clone this repository and configure at least the gitconfig file with your name and email address. The execute the setup with:

```
sudo ./setup.sh
```

If you like, configure what is being installed or fork this repository and make a pull request.

Pull requests are welcomed!

## Installs

### General packages (./scripts/packages.sh)

Shutter, VLC, Corebird, Transmission, Tmux, Clipit, Virtualbox, s3cmd, smartmontools, ctags, tlp and some other packages needed for Ubuntu working.

In addition, it will change the default shell to zsh and download ohmyzsh! It's really awesome and you should use it anyhow :)

### Remote packages (./scripts/remote.sh)

This downloads and installs packages from websites. Following applications are being installed:

OhMyZsh, Simplenote, MongoChef, Robomongo, Smartgit, Exiftool, Powerline

Files are being downloaded to our "download" folder.

Note: Mongochef is the only application that only provides a start script and doesn't install itself. Hence in order to run Mongochef you need to execute the mongochef.sh script in the bin folder (or create and alias).

### Development packages (./scripts/packages-dev.sh)

Java 8 (Oracle), Zeal, MongoDB, MySQL, Git, Elasticsearch, Python, Imagemagick, dcraw, ufraw, gpac (MP4Box).

It disables the autostart of MySQL, MongoDB and Elasticsearch.

### Nvm and node (./scripts/node.sh)

Will install nvm (node version manager) and then install the latest node release of version 6.

In addition, it will use npm to install mocha and node-dev globally.

### Atom (./scripts/atom.sh)

This will download Atom and install useful packages. Read the script to see what is being installed.

### FFmpeg (./scripts/ffmpeg.sh)

Note: Not yet done!!!

Will download all required packages, compile them and install everything for ffmpeg to be roaring on your system. This can also be used to re-install ffmpeg if a new version comes out.

### Vim configuration

I'm using vim-plug to install a ton of plugins (too many to list). Check out the .vimrc file to see and manipulate it. In addition it also configures vim with shortcuts and more.

### Zsh configuration

I love my zsh shell. I use bullet train plugins and more to make it look cool :) Read the .zshrc file to see how it is configured. To manage all plugins I use zgen.

#### Aliases

Note: Not yet configured for Ubuntu!

I couldn't live without my aliases in the shell. For easy management they all live in the .aliases file. I start mongodb, elasticsearch, elasticsearch and more with aliases.

Configure and tune for your need. Exclude them from any pull request please.

### Note

In general all scripts are independent of each other and can be executed individually to install/update applications. Please read the scripts as most links are coded to a version.

## Tweaks

* Instead of terminal execute tmux
* Terminator settings allow to copy text opon selection
* Upon selecting a text (terminal, etc.) have it automatically copied into the clipboard using clipit:
  * Right click / Preferences / Settings : check: Use Primary selections and Synchronize clipboards
  * Though, this works, it means that every selected text gets automatically copied to the clipboard. It's bothersome during coding.
* Create shortcut for Shutter
  * Go to Settings. Select Keyboard and then shortcuts. Under custom shortcuts add a new entry with:
  * Name: Shutter Selection, Command: shutter -s
  * Then assign shortcut: shift+alt+5
* Ubuntu has a habit to always start bluetooth. Disable with:
  * sudo vim /etc/rc.local
  * Add line: rfkill block bluetooth

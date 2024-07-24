#!/bin/bash -xe

# curl and wget
sudo apt install -y curl wget

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm  ripgrep_14.1.0-1_amd64.deb

# bat
sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s $(which batcat) ~/.local/bin/bat

# fd
sudo apt install -y fd-find
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

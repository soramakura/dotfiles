#!/bin/bash -xe

# curl and wget
sudo apt install -y curl wget

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm  ripgrep_14.1.0-1_amd64.deb

# bat
sudo apt install -y bat
if [ -e ~/.local/bin/bat ] ; then
  echo "bat already exists"
else
  mkdir -p ~/.local/bin
  ln -s $(which batcat) ~/.local/bin/bat
fi

# fd
sudo apt install -y fd-find
if [ -e ~/.local/bin/fd ] ; then
  echo "fd already exists"
else
  mkdir -p ~/.local/bin
  ln -s $(which fdfind) ~/.local/bin/fd
fi

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit
rm lazygit.tar.gz


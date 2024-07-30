#!/bin/bash -xe

# Install Neovim latest version
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo ./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm ./nvim.appimage

# Install deno
sudo apt install unzip
curl -fsSL https://deno.land/x/install/install.sh | sh

echo 'export DENO_INSTALL="$HOME/.deno"' >> ~/.bashrc
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

# Install denops and dpp.vim
DOTFILES_DIR=$(pwd)

mkdir -p ~/.cache/dpp/repos/github.com/
cd ~/.cache/dpp/repos/github.com

mkdir Shougo
mkdir vim-denops

cd ./Shougo
git clone https://github.com/Shougo/dpp.vim

git clone https://github.com/Shougo/dpp-ext-installer
git clone https://github.com/Shougo/dpp-ext-local
git clone https://github.com/Shougo/dpp-ext-lazy
git clone https://github.com/Shougo/dpp-ext-toml
git clone https://github.com/Shougo/dpp-protocol-git

cd ../vim-denops
git clone https://github.com/vim-denops/denops.vim

cd $DOTFILES_DIR

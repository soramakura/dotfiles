#!/bin/bash -xe

# Install Neovim latest version
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo ./nvim.appimage
rm ./nvim.appimage

# Install deno
curl -fsSL https://deno.land/install.sh | sh

# Install denops and dpp.vim
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

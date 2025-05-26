#!/bin/bash -xe

# Install Neovim latest version

NEOVIM_VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -LO "https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/nvim-linux-x86_64.appimage"
chmod u+x nvim-linux-x86_64.appimage
sudo ./nvim-linux-x86_64.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm ./nvim-linux-x86_64.appimage

echo 'export DENO_INSTALL="$HOME/.deno"' >> ~/.bashrc
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

cd ${DOTFILES_DIR}

#!/bin/bash -xe

# ripgrep
sudo dnf install -y ripgrep

# fd
sudo dnf install -y fd-find
if [ -e ~/.local/bin/fd ] ; then
  echo "fd already exists"
else
  ln -s $(which fdfind) ~/.local/bin/fd
fi

# fzf
sudo dnf install -y fzf

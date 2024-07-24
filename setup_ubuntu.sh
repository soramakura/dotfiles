#!/bin/bash -ex

readonly DOTFILES_REPO=https://github.com/soramakura/dotfiles.git

cd ~
echo "HOME dir ${HOME}"
if [ -d dotfiles ] ; then
    echo "dotfiles is checked out already."
else
    git clone $DOTFILES_REPO
fi
cd dotfiles
git pull --no-rebase $DOTFILES_REPO

unset DOTFILES_REPO

sudo apt update
./scripts/ubuntu/setup_langc.sh
./scripts/ubuntu/setup_cmdtools.sh
./scripts/ubuntu/setup_git.sh
./scripts/ubuntu/setup_rust.sh
./scripts/ubuntu/setup_helix.sh

if [ -d ~/.ssh ] && [ -f ~/.ssh/id_ed25519.pub ] ; then
    echo "id_ed25519.pub already exists"
else
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
fi

echo "Done!"

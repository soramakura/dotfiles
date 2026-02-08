#!/bin/bash -ex

readonly DOTFILES_REPO=https://github.com/soramakura/dotfiles.git
readonly DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})")

cd ~
echo $(pwd)
echo "HOME dir ${HOME}"
if [ -d dotfiles ] ; then
    echo "dotfiles is checked out already."
else
    git clone ${DOTFILES_REPO}
fi
cd dotfiles

sudo dnf check-upgrade
sudo dnf upgrade

source ./scripts/fedora/cli/install_clitools.sh
source ./scripts/fedora/cli/install_git.sh
source ./scripts/fedora/cli/install_langc.sh
source ./scripts/fedora/cli/install_rust.sh
source ./scripts/fedora/cli/install_neovim.sh
source ./scripts/fedora/cli/install_helix.sh
source ./scripts/fedora/cli/install_tmux.sh
source ./scripts/fedora/cli/link.sh

if [ -d ~/.ssh ] && [ -f ~/.ssh/id_ed25519.pub ] ; then
    echo "id_ed25519.pub already exists"
else
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
fi

echo "Done!"

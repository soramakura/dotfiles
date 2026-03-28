#!/bin/bash -xe

# Install Fctix5
sudo dnf install fcitx5 fcitx5-configtool fcitx5-autostart fcitx5-mozc

# Set as defaut input method
echo "export XMODIFIERS=@im=fcitx5" >> ${HOME}/.bash_profile

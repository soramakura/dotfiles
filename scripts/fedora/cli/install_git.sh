#!/bin/bash -xe

# Git
sudo dnf install -y git

git config --global user.email          '100016927+soramakura@users.noreply.github.com'
git config --global user.name           'soramakura'
git config --global core.editor         'nvim'
git config --global core.quotepath      'false'
git config --global core.autocrlf       'input'
git config --global init.defaultBranch  'main'
git config --global merge.ff            'false'
git config --global fetch.prune         'true'
git config --global pull.ff             'only'
git config --global push.default        'current'
git config --global color.ui            'auto'

# GitHub CLI
sudo dnf install -y gh

# Lazygit
sudo dnf copr enable dejan/lazygit
sudo dnf install -y lazygit

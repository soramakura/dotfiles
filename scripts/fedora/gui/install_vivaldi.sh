#!/bin/bash -xe

sudo dnf config-manager addrepo --from-repofile=https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf install vivaldi-stable

#!/bin/bash -xe

# VLC
sudo dnf install vlc

# enable RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# ffmpeg
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# libva
sudo dnf install libva-utils libva-nvidia-driver

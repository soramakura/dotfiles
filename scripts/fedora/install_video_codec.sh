#!/bin/bash -xe

DOTFILES_DIR=$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")

# Enable RPM Fusion
source ${DOTFILES_DIR}/scripts/fedora/enable_rpm_fusion.sh

# ffmpeg
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# libva
sudo dnf install libva-utils

# libavcodec
sudo dnf install libavcodec-freeworld

# vulkan-tools
sudo dnf install vulkan-tools

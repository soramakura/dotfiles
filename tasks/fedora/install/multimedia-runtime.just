[group("multimedia-runtime")]
ffmpeg:
    #!/bin/env bash
    set -euxo pipefail

    if dnf repolist | grep -q "rpmfusion-nonfree"; then
        sudo dnf install -y ffmpeg --allowerasing
        sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
    else
        sudo dnf install -y ffmpeg-free
    fi

[group("multimedia-runtime")]
libva-utils:
    sudo dnf install libva-utils

[group("multimedia-runtime")]
vulkan-tools:
    sudo dnf install vulkan-tools

[group("multimedia-runtime")]
libavcodec: _dnf::enable-rpm-fusion
    sudo dnf install libavcodec-freeworld

[group("multimedia-runtime")]
alsa-utils:
    sudo dnf install alsa-utils

[group("multimedia-runtime")]
pipewire: alsa-utils
    sudo dnf install pipewire wireplumber pipewire-pulseaudio pipewire-alsa pipewire-utils 

    systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service

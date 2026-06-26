[group("multimedia-apps")]
strawberry: pipewire
    sudo dnf install strawberry

[group("multimedia-apps")]
mpv: ffmpeg
    sudo dnf install mpv

    ln -snf "{{justfile_directory()}}/config/mpv" "{{config_directory()}}/"

[group("multimedia-apps")]
imv:
    sudo dnf install imv

[group("multimedia-apps")]
alsamixer: pipewire
    sudo dnf install alsamixer

[group("multimedia-apps")]
wiremix: pipewire
    sudo dnf install wiremix

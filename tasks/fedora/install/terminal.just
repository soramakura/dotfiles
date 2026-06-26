[group("terminal")]
foot: hackgen twemoji
    sudo dnf install foot

    ln -snf "{{justfile_directory()}}/config/foot" "{{config_directory()}}/"

[group("terminal")]
ghostty: hackgen
    sudo dnf install ghostty

    ln -snf "{{justfile_directory()}}/config/ghostty" "{{config_directory()}}/"

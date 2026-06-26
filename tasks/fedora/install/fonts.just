_make_fonts_dir:
    sudo mkdir -p "/usr/local/share/fonts"

[group("fonts")]
fontconfig:
    sudo dnf install fontconfig

[group("fonts")]
noto: _make_fonts_dir fontconfig
    sudo dnf install google-noto-fonts-all-vf
    fc-cache -fv

[group("fonts")]
twemoji: _make_fonts_dir fontconfig
    sudo dnf install twitter-twemoji-fonts
    fc-cache -fv

[group("fonts")]
hackgen: _make_fonts_dir fontconfig
    #!/bin/env bash
    set -euxo pipefail

    HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "\K[^"]*')

    curl -LO "https://github.com/yuru7/HackGen/releases/download/${HACKGEN_VERSION}/HackGen_NF_${HACKGEN_VERSION}.zip"
    unzip "./HackGen_NF_${HACKGEN_VERSION}.zip" -d "./temporary"
    find "./temporary" \( -name "*.otf" -o -name "*.ttf" \) -exec sudo mv {} "/usr/local/share/fonts/" \;
    rm -rf "./HackGen_NF_${HACKGEN_VERSION}.zip" "./temporary"

    fc-cache -fv

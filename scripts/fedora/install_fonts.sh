#!/bin/bash -xe

sudo mkdir -p "/usr/local/share/fonts"

sudo dnf install google-noto-sans-cjk-vf-fonts google-noto-serif-cjk-vf-fonts twitter-twemoji-fonts

HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/yuru7/HackGen/releases/download/${HACKGEN_VERSION}/HackGen_NF_${HACKGEN_VERSION}.zip"
unzip "./HackGen_NF_${HACKGEN_VERSION}.zip" -d "./temporary"
find "./temporary" \( -name "*.otf" -o -name "*.ttf" \) -exec sudo mv {} "/usr/local/share/fonts/" \;
rm -rf "./HackGen_NF_${HACKGEN_VERSION}.zip" "./temporary"

sudo dnf install fontconfig

fc-cache -fv

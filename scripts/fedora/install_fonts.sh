#!/bin/bash -xe

sudo mkdir -p "/usr/local/share/fonts"

# Noto fonts
sudo dnf install google-noto-fonts-all

# HackGen
HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/yuru7/HackGen/releases/download/${HACKGEN_VERSION}/HackGen_NF_${HACKGEN_VERSION}.zip"
unzip "./HackGen_NF_${HACKGEN_VERSION}.zip" -d "./temporary"
find "./temporary" \( -name "*.otf" -o -name "*.ttf" \) -exec sudo mv {} "/usr/local/share/fonts/" \;
rm -rf "./HackGen_NF_${HACKGEN_VERSION}.zip" "./temporary"

# Twemoji
TWEMOJI_VERSION=$(curl -s "https://api.github.com/repos/JoeBlakeB/ttf-twemoji/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/JoeBlakeB/ttf-twemoji/releases/download/${TWEMOJI_VERSION}/Twemoji-${TWEMOJI_VERSION}.ttf"
sudo mv "Twemoji-${TWEMOJI_VERSION}.ttf" "/usr/local/share/fonts/"

sudo dnf install fontconfig

fc-cache -fv

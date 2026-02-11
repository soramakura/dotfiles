#!/bin/bash -xe

HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/yuru7/HackGen/releases/download/${HACKGEN_VERSION}/HackGen_NF_${HACKGEN_VERSION}.zip"
unzip "./HackGen_NF_${HACKGEN_VERSION}.zip" -d "./temporary"
find "./temporary" \( -name "*.otf" -o -name "*.ttf" \) -exec sudo mv {} "/usr/local/share/fonts/" \;
rm -rf "./HackGen_NF_${HACKGEN_VERSION}.zip" "./temporary"

SOURCE_HAN_SERIF_VERSION=$(curl -s "https://api.github.com/repos/adobe-fonts/source-han-serif/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/adobe-fonts/source-han-serif/releases/download/${SOURCE_HAN_SERIF_VERSION}/07_SourceHanSerifJ.zip"
unzip "./07_SourceHanSerifJ.zip" -d "./temporary"
find "./temporary" \( -name "*.otf" -o -name "*.ttf" \) -exec sudo mv {} "/usr/local/share/fonts/" \;
rm -rf "./07_SourceHanSerifJ.zip" "./temporary"

SOURCE_HAN_SANS_VERSION=$(curl -s "https://api.github.com/repos/adobe-fonts/source-han-sans/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/adobe-fonts/source-han-sans/releases/download/${SOURCE_HAN_SANS_VERSION}/07_SourceHanSansJ.zip"
unzip "./07_SourceHanSansJ.zip" -d "./temporary"
find "./temporary" \( -name "*.otf" -o -name "*.ttf" \) -exec sudo mv {} "/usr/local/share/fonts/" \;
rm -rf "./07_SourceHanSansJ.zip" "./temporary"

fc-cache -fv

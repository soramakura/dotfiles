#!/bin/bash -xe

HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/yuru7/HackGen/releases/download/${HACKGEN_VERSION}/HackGen_NF_${HACKGEN_VERSION}.zip"
sudo unzip "./HackGen_NF_${HACKGEN_VERSION}.zip" -d "/usr/local/share/fonts/"
rm "./HackGen_NF_${HACKGEN_VERSION}.zip"

SOURCE_HAN_SERIF_VERSION=$(curl -s "https://api.github.com/repos/adobe-fonts/source-han-serif/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/adobe-fonts/source-han-serif/releases/download/${SOURCE_HAN_SERIF_VERSION}/07_SourceHanSerifJ.zip"
sudo unzip "./07_SourceHanSerifJ.zip" -d "/usr/local/share/fonts/"
rm "./07_SourceHanSerifJ.zip"

SOURCE_HAN_SANS_VERSION=$(curl -s "https://api.github.com/repos/adobe-fonts/source-han-sans/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -LO "https://github.com/adobe-fonts/source-han-sans/releases/download/${SOURCE_HAN_SANS_VERSION}/07_SourceHanSansJ.zip"
sudo unzip "./07_SourceHanSansJ.zip" -d "/usr/local/share/fonts/"
rm "./07_SourceHanSansJ.zip"

fc-cache -fv

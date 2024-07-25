#!/bin/bash -xe

sudo apt install -y build-essential make wget

wget https://apt.llvm.org/llvm.sh
chmod u+x llvm.sh
sudo ./llvm.sh 18 all
rm ./llvm.sh

sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-18 1
sudo update-alternatives --install /usr/bin/clang clang++ /usr/bin/clang++-18 1
sudo update-alternatives --install /usr/bin/clang lldb /usr/bin/lldb-18 1
sudo update-alternatives --install /usr/bin/clang lld /usr/bin/lld-18 1

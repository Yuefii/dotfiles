#!/bin/bash

sudo pacman -Syu

sudo pacman -S zsh

chsh -s /usr/bin/zsh

sudo pacman -S git wget

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

source ~/.zshrc

echo "Instalasi selesai. Silakan logout dan login kembali untuk menggunakan zsh."

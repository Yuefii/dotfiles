#!/bin/bash

sudo pacman -Syu

git clone https://aur.archlinux.org/yay-git.git

sudo mv yay-git /opt/

cd /opt/yay-git

makepkg -si

sudo yay

yay -S github-desktop-bin --noconfirm

echo "Instalasi Github Desktop telah selesai."
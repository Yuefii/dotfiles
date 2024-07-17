#!/bin/bash

sudo pacman -Syu

sudo pacman -S git base-devel

git clone https://aur.archlinux.org/visual-studio-code-bin.git

cd visual-studio-code-bin

makepkg -si

echo "Instalasi Google Chrome telah selesai."
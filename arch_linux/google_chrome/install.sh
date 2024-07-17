#!/bin/bash

sudo pacman -Syu

sudo pacman -S --needed base-devel git

git clone https://aur.archlinux.org/google-chrome.git

cd google-chrome

makepkg -si

echo "Instalasi Google Chrome telah selesai."
#!/bin/bash

sudo pacman -Syu

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh

source ~/.zshrc

nvm install v20.15.1

nvm use v20.15.1

node -v
npm -v

echo "Instalasi Node.js telah selesai."
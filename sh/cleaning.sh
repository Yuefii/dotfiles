#!/bin/bash

sudo pacman -Scc --noconfirm
sudo pacman -Sc --noconfirm
yay -Scc --noconfirm
yay -Sc --noconfirm
sudo pacman -Rns $(pacman -Qtdq)

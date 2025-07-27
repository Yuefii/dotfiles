#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S docker --noconfirm

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER

sudo pacman -S docker-compose --noconfirm

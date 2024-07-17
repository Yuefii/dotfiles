#!/bin/bash

sudo pacman -Syu

sudo pacman -S docker

sudo pacman -S docker-compose

sudo docker version

sudo systemctl start docker

sudo systemctl status docker

sudo systemctl enable docker

sudo usermod -aG docker $USER

echo "Instalasi Docker telah selesai."
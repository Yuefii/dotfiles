#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S composer --noconfirm

composer --version

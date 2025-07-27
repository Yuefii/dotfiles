#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S apache --noconfirm

sudo systemctl start httpd
sudo systemctl enable httpd

sudo chown -R upii:http /srv/http
sudo chmod -R 775 /srv/http

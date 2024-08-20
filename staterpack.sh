#!/bin/bash

prompt_confirm() {
    while true; do
        read -rp "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

echo "Welcome to the interactive installation script."

##########################################################################
######################### Docker Installation ############################
##########################################################################
if prompt_confirm "Do you want to start the installation of Docker?"; then
    echo "Starting Docker Installation"
    sudo pacman -Syu
    sudo pacman -S docker
    sudo pacman -S docker-compose
    sudo systemctl start docker
    sudo systemctl status docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
else
    echo "Docker installation skipped."
fi

############################################################################
############################ Go Installation ###############################
############################################################################
if prompt_confirm "Do you want to start the installation of Go?"; then
    echo "Starting Go Installation"
    sudo pacman -S go
else
    echo "Go installation skipped."
fi

#############################################################################
########################### Python Installation #############################
#############################################################################
if prompt_confirm "Do you want to start the installation of Python?"; then
    echo "Starting Python Installation"
    sudo pacman -S python
    python --version
    sudo pacman -S python-pip
    pip --version
else
    echo "Python installation skipped."
fi

####################################################################################
############################# Node.js Installation #################################
####################################################################################
if prompt_confirm "Do you want to start the installation of Node.js?"; then
    echo "Starting Node.js Installation"
    sudo pacman -S wget
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
    source ~/.zshrc
    nvm install v20.15.1
    nvm use v20.15.1
    node -v
    npm -v
else
    echo "Node.js installation skipped."
fi

#######################################################################################
######################### Visual Studio Code Installation #############################
#######################################################################################
if prompt_confirm "Do you want to start the installation of Visual Studio Code?"; then
    echo "Starting Visual Studio Code Installation"
    sudo pacman -S git base-devel
    git clone https://aur.archlinux.org/visual-studio-code-bin.git
    cd visual-studio-code-bin || { echo "Failed to change directory"; exit 1; }
    makepkg -si
else
    echo "Visual Studio Code installation skipped."
fi

echo "Installation script completed."

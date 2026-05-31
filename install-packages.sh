#!/bin/bash

set -euo pipefail

# Create a directory for downloads
download_dir="${HOME}/downloads"
mkdir -p "${download_dir}"
cd "${download_dir}"

# Install apt packages
sudo apt update
sudo apt install -y \
        curl \
        vim \
        git \
        tmux

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker || true
sudo usermod -aG docker $USER
rm get-docker.sh

# Install vim-plug (vim plugin manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim color schemes
mkdir -p ~/.vim/colors
curl -fLo ~/.vim/colors/gruvbox.vim --create-dirs \
    https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
curl -fLo ~/.vim/colors/twilight256.vim --create-dirs \
    https://raw.githubusercontent.com/vim-scripts/twilight256.vim/master/colors/twilight256.vim

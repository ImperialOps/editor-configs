#!/usr/bin/env bash

sudo apt update

# essentials
sudo apt install -y \
    vim \
    zip \
    git \
    build-essential \
    xclip

git config --global user.name "Josh B"
git config --global user.email "josh9398@hotmail.com"
git config --global init.defaultBranch "main"

# install mini-conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh

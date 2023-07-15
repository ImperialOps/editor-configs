#!/usr/bin/env bash

sudo apt update

# essentials
sudo apt install -y \
    zip \
    git \
    tmux \
    build-essential

git config --global user.name "Josh B"
git config --global user.email "josh9398@hotmail.com"

# install mini-conda


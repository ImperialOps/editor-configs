#!/usr/bin/env bash

# /etc/sudoers
# username ALL=(ALL) NOPASSWD:ALL

sudo apt update

# essentials
sudo apt install -y \
    curl \
    vim \
    zip \
    git \
    build-essential \
    xclip

git config --global user.name "Josh B"
git config --global user.email "joshb9398@gmail.com"
git config --global init.defaultBranch "main"
git config --global core.editor "vim"

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install \
  gcc \
  opentofu \
  tflint \
  infracost \
  pre-commit \
  commitizen \
  node \
  go \
  awscli \
  aws-iam-authenticator \
  binutils \
  kubernetes-cli \
  kustomize \
  k9s \
  kind \
  helm \
  skaffold \
  ipcalc \
  xsel \
  tree \
  jq \
  yq \
  tmux


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
git config --global user.email "josh9398@hotmail.com"
git config --global init.defaultBranch "main"

# install mini-conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh
conda init

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install \
  terraform \
  infracost \
  tflint \
  terraform-docs \
  infracost \
  pre-commit \
  commitizen \
  node \
  shellcheck \
  go \
  gopls \
  rust \
  awscli \
  aws-iam-authenticator \
  binutils \
  kubernetes-cli \
  kustomize \
  k9s \
  kubeconform \
  kind \
  helm \
  skaffold \
  ipcalc \
  neovim \
  ripgrep \
  xsel \
  tree \
  jq \
  yq \
  tmux

# LSP requirements
npm i -g bash-language-server

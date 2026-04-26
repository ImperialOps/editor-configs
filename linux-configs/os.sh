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
git config --global core.editor "vim"

# install mini-conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh
conda init

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install \
  gcc \
  terraform \
  infracost \
  tflint \
  terraform-docs \
  infracost \
  pre-commit \
  commitizen \
  node \
  go \
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
  xsel \
  tree \
  jq \
  yq \
  tmux

# neovim requirements
npm i -g \
  bash-language-server \
  @tailwindcss/language-server
brew install \
  neovim \
  shellcheck \
  ripgrep

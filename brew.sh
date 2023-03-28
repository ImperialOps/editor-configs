#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install terraform \
  infracost \
  tflint \
  terraform-docs \
  infracost \
  pre-commit \
  commitizen \
  go \
  awscli \
  aws-iam-authenticator \
  binutils \
  kind \
  helm \
  skaffold \
  kubernetes-cli \
  kustomize \
  kubeconform \
  ipcalc \
  neovim \
  ripgrep \
  tree

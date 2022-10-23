#!/usr/bin/env bash


echo "Installing VSCode, neovim, gh, zsh, fortune-mod, and docker"
sleep 1.5s
brew install --cask visual-studio-code
brew install neovim
brew install gh
brew install zsh

# Needed for ohmyzsh
brew install fortune

# Docker Desktop
# https://docs.docker.com/get-started/
brew install --cask docker


echo "Setting up python3/pip"
sleep 1s
# download and install setuptools
curl -O https://bootstrap.pypa.io/ez_setup.py
python3 ez_setup.py
# download and install pip
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py

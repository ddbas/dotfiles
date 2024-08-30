#!/usr/bin/env bash

# Source the environment variables
source ./env.sh

# Stow the folders
echo -e "\n--- Stowing folders ---\n"
for folder in ${STOW_FOLDERS[@]}
do
  echo "Stowing $folder"
  stow -R -t ~ $folder
done

# Install brew packages
echo -e "\n--- Brew install ---\n"
brew bundle install

# Install npm packages
echo -e "\n--- Npm install ---\n"
cd ~/.config/npm && npm ci

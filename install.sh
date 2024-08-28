#!/usr/bin/env bash

# Source the environment variables
source ./env.sh

# Stow the folders
echo "--- Stowing folders ---"
for folder in ${STOW_FOLDERS[@]}
do
  echo "Stowing $folder"
  stow -R -t ~ $folder
done

# Install the packages
echo "--- Installing packages ---"
brew bundle install
cd ~/.config/npm && npm ci

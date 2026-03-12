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
if [ -f ~/.config/npm/package-lock.json ]; then
  cd ~/.config/npm && npm ci
else
  cd ~/.config/npm && npm install
fi

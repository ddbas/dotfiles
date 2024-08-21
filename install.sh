#!/usr/bin/env bash

source ./env.sh
for folder in ${STOW_FOLDERS[@]}
do
  echo "Stowing $folder"
  stow -R -t ~ $folder
done

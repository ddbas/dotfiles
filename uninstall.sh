#!/usr/bin/env bash

source ./env.sh
for folder in ${STOW_FOLDERS[@]}
do
  echo "Removing $folder"
  stow -D -t ~ $folder
done

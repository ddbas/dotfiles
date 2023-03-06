#!/usr/bin/env bash

echo "Uninstall nix packages"
nix-env -e '.*'

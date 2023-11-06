#!/usr/bin/env bash

brew bundle
npm install -g \
  typescript-language-server typescript \
  @tailwindcss/language-server \
  bash-language-server \
  yaml-language-server \
  vscode-langservers-extracted

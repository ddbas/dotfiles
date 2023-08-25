#!/usr/bin/env bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

uninstall_packages=
uninstall_configurations=
uninstall_scripts=

help() {
  cat << EOF
usage: $0 [OPTIONS]

    --help                Show this message
    --all                 Uninstall packages, configurations and scripts
    --[no-]packages       Uninstall packages
    --[no-]configurations Uninstall configurations
    --[no-]scripts        Uninstall scripts
EOF
}

for opt in "$@"; do
  case $opt in
    --help)
      help
      exit 0
      ;;
    --all)
      uninstall_packages=1
      uninstall_configurations=1
      uninstall_scripts=1
      ;;
    --packages)          uninstall_packages=1       ;;
    --no-packages)       uninstall_packages=0       ;;
    --configurations)    uninstall_configurations=1 ;;
    --no-configurations) uninstall_configurations=0 ;;
    --scripts)           uninstall_scripts=1        ;;
    --no-scripts)        uninstall_scripts=0        ;;
    *)
      echo "unknown option: $opt"
      help
      exit 1
      ;;
  esac
done

ask() {
  while true; do
    read -p "$1 ([y]/n) " -r
    REPLY=${REPLY:-"y"} # default to yes
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      return 1
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
      return 0
    fi
  done
}

if [ -z "$uninstall_packages" ]; then
  ask "Do you want to uninstall the packages?"
  uninstall_packages=$?
fi

if [ -z "$uninstall_configurations" ]; then
  ask "Do you want to uninstall the configurations?"
  uninstall_configurations=$?
fi

if [ -z "$uninstall_scripts" ]; then
  ask "Do you want to uninstall the scripts?"
  uninstall_scripts=$?
fi

if [ $uninstall_scripts -eq 1 ]; then
  echo -e "${GREEN}>>${NC} Uninstalling scripts"
  if [ -L ~/.local/bin ]; then
      rm -rf ~/.local/bin 2> /dev/null
  fi
fi

uninstall_alacritty_config() {
  if [ -L ~/.config/alacritty ]; then
      echo -e "${BLUE}>>${NC} Alacritty"
      rm -rf ~/.config/alacritty 2> /dev/null
  fi
}

uninstall_zsh_config() {
  if [ -L ~/.zshrc ]; then
      echo -e "${BLUE}>>${NC} Zsh"
      rm ~/.zshrc 2> /dev/null
  fi
}

uninstall_tmux_config() {
  if [ -L ~/.config/tmux ] || [ -L ~/.local/share/tmux ]; then
      echo -e "${BLUE}>>${NC} Tmux"
  fi

  if [ -L ~/.config/tmux ]; then
      rm -rf ~/.config/tmux 2> /dev/null
  fi

  if [ -d ~/.local/share/tmux ]; then
      rm -rf ~/.local/share/tmux 2> /dev/null
  fi
}

uninstall_starship_config() {
  if [ -L ~/.config/starship.toml ]; then
      echo -e "${BLUE}>>${NC} Starship"
      rm ~/.config/starship.toml 2> /dev/null
  fi
}

uninstall_git_config() {
  if [ -L ~/.gitconfig ] && [ -L ~/.gitmessage ]; then
      echo -e "${BLUE}>>${NC} Git"
      rm ~/.gitconfig 2> /dev/null
      rm ~/.gitmessage 2> /dev/null
  fi
}

uninstall_helix_config() {
  if [ -L ~/.config/helix ]; then
      echo -e "${BLUE}>>${NC} Helix"
      rm -rf ~/.config/helix 2> /dev/null
  fi
}

if [ $uninstall_configurations -eq 1 ]; then
  echo -e "${GREEN}>>${NC} Uninstalling configurations"
  uninstall_alacritty_config
  uninstall_zsh_config
  uninstall_tmux_config
  uninstall_starship_config
  uninstall_git_config
  uninstall_helix_config
fi

brew_uninstall() {
  echo -e "${BLUE}>>${NC} Homebrew uninstall"
  cat packages.txt | grep -v -e '^\s*$' | grep -v '#' | xargs brew uninstall
}

undo_tmux() {
  if [ -f ~/.local/share/terminfo/74/tmux-256color ]; then
    echo -e "${BLUE}>>${NC} Undo tmux setup"
    rm ~/.local/share/terminfo/74/tmux-256color
  fi
}

if [ $uninstall_packages -eq 1 ]; then
  echo -e "${GREEN}>>${NC} Uninstalling packages"
  brew_uninstall
  undo_tmux
fi


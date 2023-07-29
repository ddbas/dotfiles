#!/usr/bin/env bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

install_packages=
install_configurations=
install_scripts=

help() {
  cat << EOF
usage: $0 [OPTIONS]

    --help                Show this message
    --all                 Install packages, configurations and scripts
    --[no-]packages       Install packages
    --[no-]configurations Install configurations
    --[no-]scripts        Install scripts
EOF
}

for opt in "$@"; do
  case $opt in
    --help)
      help
      exit 0
      ;;
    --all)
      install_packages=1
      install_configurations=1
      install_scripts=1
      ;;
    --packages)          install_packages=1       ;;
    --no-packages)       install_packages=0       ;;
    --configurations)    install_configurations=1 ;;
    --no-configurations) install_configurations=0 ;;
    --scripts)           install_scripts=1        ;;
    --no-scripts)        install_scripts=0        ;;
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

if [ -z "$install_packages" ]; then
  ask "Do you want to install the packages?"
  install_packages=$?
fi

if [ -z "$install_configurations" ]; then
  ask "Do you want to install the configurations?"
  install_configurations=$?
fi

if [ -z "$install_scripts" ]; then
  ask "Do you want to install the scripts?"
  install_scripts=$?
fi

brew_install() {
  echo -e "${BLUE}>>${NC} Homebrew install"
  cat packages.txt | grep -v -e '^\s*$' | grep -v '#' | xargs brew install
}

setup_tmux() {
  if [ ! -f ~/.local/share/terminfo/74/tmux-256color ]; then
    echo -e "${BLUE}>>${NC} Setup tmux"
    # https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
    $(brew --prefix)/opt/ncurses/bin/infocmp -x tmux-256color > ~/tmux-256color.src
    sed -i '' -e 's/pairs#0x10000/pairs#32767/g' ~/tmux-256color.src
    sed -i '' -e 's/pairs#65536/pairs#32767/g' ~/tmux-256color.src
    mkdir -p ~/.local/share
    /usr/bin/tic -x -o $HOME/.local/share/terminfo ~/tmux-256color.src
    rm ~/tmux-256color.src
  fi
}

setup_fzf() {
  echo -e "${BLUE}>>${NC} Setup fzf"
  $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
}

if [ $install_packages -eq 1 ]; then
  echo -e "${GREEN}>>${NC} Installing packages"
  brew_install
  setup_tmux
  setup_fzf
fi

install_alacritty_config() {
  if [ ! -f ~/.config/alacritty ]; then
      echo -e "${BLUE}>>${NC} Alacritty"
      mkdir -p ~/.config
      ln -s $PWD/alacritty ~/.config/alacritty
  fi
}

install_zsh_config() {
  if [ ! -f ~/.zshrc ]; then
      echo -e "${BLUE}>>${NC} Zsh"
      ln -s $PWD/zsh/.zshrc ~/.zshrc
  fi
}

install_tmux_config() {
  if [ ! -f ~/.tmux.conf ]; then
      echo -e "${BLUE}>>${NC} Tmux"
      ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf
  fi
}

install_git_config() {
  if [ ! -f ~/.gitconfig ] && [ ! -f ~/.gitmessage ]; then
      echo -e "${BLUE}>>${NC} Git"
      ln -s $PWD/git/git-config ~/.gitconfig
      ln -s $PWD/git/git-message ~/.gitmessage
  fi
}

install_helix_config() {
  if [ ! -d ~/.config/helix ]; then
      echo -e "${BLUE}>>${NC} Helix"
      mkdir -p ~/.config
      ln -s $PWD/helix ~/.config/helix
  fi
}

if [ $install_configurations -eq 1 ]; then
  echo -e "${GREEN}>>${NC} Installing configurations"
  install_alacritty_config
  install_zsh_config
  install_tmux_config
  install_git_config
  install_helix_config
fi

if [ $install_scripts -eq 1 ]; then
  echo -e "${GREEN}>>${NC} Installing scripts"
  if [ ! -d ~/.local/bin ]; then
      mkdir -p ~/.local
      ln -s $PWD/bin ~/.local/bin
  fi
fi

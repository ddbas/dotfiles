#!/usr/bin/env bash
set -euo pipefail

# ─── Colours & icons ──────────────────────────────────────────────────────────
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

BG_BLUE="\033[44m"
BG_MAGENTA="\033[45m"

TICK="${GREEN}✔${RESET}"
CROSS="${RED}✘${RESET}"
ARROW="${CYAN}➜${RESET}"
BULLET="${DIM}•${RESET}"

# ─── Helpers ──────────────────────────────────────────────────────────────────
banner() {
  local label="$1"
  local icon="$2"
  local width=50
  local pad=$(( (width - ${#label} - 4) / 2 ))
  local line
  printf -v line '%*s' "$width" '' && line="${line// /─}"
  echo
  echo -e "  ${BOLD}${CYAN}${line}${RESET}"
  printf "  ${BOLD}${CYAN}│%*s${icon}  ${WHITE}${BOLD}%-*s${CYAN}%*s│${RESET}\n" \
    "$pad" "" "$((${#label} + 1))" "$label" "$((pad - 1))" ""
  echo -e "  ${BOLD}${CYAN}${line}${RESET}"
  echo
}

step() { echo -e "  ${ARROW} ${BOLD}$*${RESET}"; }
ok()   { echo -e "  ${TICK} $*"; }
warn() { echo -e "  ${YELLOW}⚠${RESET}  $*"; }
fail() { echo -e "  ${CROSS} ${RED}$*${RESET}" >&2; }

hr() {
  echo -e "  ${DIM}$(printf '%.0s─' {1..50})${RESET}"
}

run_step() {
  # run_step "label" <command...>
  local label="$1"; shift
  echo -e "  ${BULLET} ${label}..."
  if "$@"; then
    ok "${label}"
  else
    fail "${label} failed (exit $?)"
    return 1
  fi
}

# ─── Usage ────────────────────────────────────────────────────────────────────
usage() {
  echo
  echo -e "  ${BOLD}${WHITE}install.sh${RESET} — dotfiles installer"
  echo
  echo -e "  ${BOLD}USAGE${RESET}"
  echo -e "    ${CYAN}./install.sh${RESET} [options]"
  echo
  echo -e "  ${BOLD}OPTIONS${RESET}"
  echo -e "    ${YELLOW}--steps${RESET}=<list>  Comma-separated steps to run: ${CYAN}stow${RESET}, ${CYAN}brew${RESET}, ${CYAN}npm${RESET}"
  echo -e "                     ${DIM}(omit to run all steps)${RESET}"
  echo -e "    ${YELLOW}--help${RESET}           Show this help and exit"
  echo
  echo -e "  ${BOLD}EXAMPLES${RESET}"
  echo -e "    ${DIM}# Run everything${RESET}"
  echo -e "    ${CYAN}./install.sh${RESET}"
  echo
  echo -e "    ${DIM}# Only re-stow and refresh npm packages${RESET}"
  echo -e "    ${CYAN}./install.sh --steps=stow,npm${RESET}"
  echo
}

# ─── Parse arguments ──────────────────────────────────────────────────────────
DO_STOW=false
DO_BREW=false
DO_NPM=false

for arg in "$@"; do
  case "$arg" in
    --steps=*)
      IFS=',' read -ra STEPS <<< "${arg#--steps=}"
      for s in "${STEPS[@]}"; do
        case "$s" in
          stow)   DO_STOW=true ;;
          brew)   DO_BREW=true ;;
          npm)    DO_NPM=true ;;
          *)
            fail "Unknown step: '$s' (valid: stow, brew, npm)"
            exit 1
            ;;
        esac
      done
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      fail "Unknown option: $arg"
      usage
      exit 1
      ;;
  esac
done

# Default: run all steps when --steps was not given
if ! $DO_STOW && ! $DO_BREW && ! $DO_NPM; then
  DO_STOW=true
  DO_BREW=true
  DO_NPM=true
fi

# ─── Header ───────────────────────────────────────────────────────────────────
echo
echo -e "  ${BOLD}${BG_BLUE}${WHITE}  ✦  dotfiles installer  ✦  ${RESET}"
echo -e "  ${DIM}$(date '+%Y-%m-%d %H:%M:%S')${RESET}"

# Summarise what will run
echo
echo -e "  ${BOLD}Steps to run:${RESET}"
$DO_BREW   && echo -e "    ${BULLET} brew"
$DO_STOW   && echo -e "    ${BULLET} stow"
$DO_NPM    && echo -e "    ${BULLET} npm"
hr

# ─── Source env ───────────────────────────────────────────────────────────────
source ./env.sh
export HOMEBREW_BUNDLE_FILE="$PWD/brewfile/.config/brewfile/Brewfile"

# ─── Step 1: Brew ─────────────────────────────────────────────────────────────
if $DO_BREW; then
  banner "Homebrew" "🍺"
  step "Running brew bundle install..."
  echo
  brew bundle install
  echo
  ok "brew bundle complete"
fi

# ─── Step 2: Stow ─────────────────────────────────────────────────────────────
if $DO_STOW; then
  banner "Stow" "🔗"
  run_step "git submodule update" git submodule update --init --recursive
  run_step "create symlink parent folders" mkdir -p ~/.claude/skills ~/.local/bin
  for folder in "${STOW_FOLDERS[@]}"; do
    run_step "stow $folder" stow -R -t ~ "$folder"
  done
fi

# ─── Step 3: npm ──────────────────────────────────────────────────────────────
if $DO_NPM; then
  banner "npm" "📦"
  # ~/.nvmrc comes from the 'npm' stow package and pins the Node version.
  run_step "fnm install" bash -c "cd ~ && fnm install"
  run_step "fnm default" bash -c "fnm default \$(cat ~/.nvmrc)"
  run_step "npm install" bash -c "eval \"\$(fnm env)\" && fnm use \$(cat ~/.nvmrc) && cd ~/.config/npm && npm install"
fi

# ─── Done ─────────────────────────────────────────────────────────────────────
hr
echo
echo -e "  ${GREEN}${BOLD}✦  All done!${RESET}"
echo

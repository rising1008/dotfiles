#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"

source "${SCRIPT_DIR}/lib/utils.sh"

: --------------------------------------------------
:  Constraints
: --------------------------------------------------
VERSION="0.1.0"
OS_TYPE="$(uname -s)"
TIMESTAMP=$(date  "+%Y%m%d-%H%M%S")
BACKUP_DIR="${HOME}/.backup/${TIMESTAMP}"
ORIGIN_BACKUP_DIR="${HOME}/.backup/origin"

: --------------------------------------------------
:  Functions
: --------------------------------------------------
banner() {
  printf -- "\n"
  printf -- "  dotfiles _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n"
  printf -- "\n"
  printf -- "  VERSION: %s\n" "$1"
  printf -- "  OS_TYPE: %s\n" "$2"
  printf -- " _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n"
  printf -- "\n"
}

init () {
  [ -d "${ORIGIN_BACKUP_DIR}" ] || mkdir -p "${ORIGIN_BACKUP_DIR}"
  [ -d "${BACKUP_DIR}" ] || mkdir -p "${BACKUP_DIR}"
}

install_homebrew () {
  [ ! -z `type -p brew` ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_packages () {
  brew bundle --file "${SCRIPT_DIR}/settings/darwin/Brewfile"
  : install imgcat command
  [ -f "${SCRIPT_DIR}/bin/imgcat" ] || curl https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat > "${SCRIPT_DIR}/bin/imgcat"
  [ -f "${SCRIPT_DIR}/bin/imgcat" ] && chmod 755 "${SCRIPT_DIR}/bin/imgcat"
}

setup_neovim () {
  : install dein.vim
  if [ ! -d "${HOME}"/.cache/dein/repos/github.com/Shougo/dein.vim ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > "${HOME}"/installer.sh
    sh "${HOME}"/installer.sh "${HOME}"/.cache/dein
    rm "${HOME}/installer.sh"
  fi
  : setup configuration files
  if [ ! -d "${HOME}/.config" ]; then
    mkdir -p "${HOME}/.config"
    ln -snf "${SCRIPT_DIR}/settings/nvim" "${HOME}/.config"
  fi
}

setup_vscode () {
  local BACKUP_DIR=$1

  : backup
  cp "${HOME}/Library/Application\ Support/Code/User/keybindings.json" "${BACKUP_DIR}/keybindings.json"
  cp "${HOME}/Library/Application\ Support/Code/User/settings.json" "${BACKUP_DIR}/settings.json"
  #ln -snf ${TARGET_DIR}/settings/vscode/keybindings.json ${HOME}/Library/Application\ Support/Code/User/keybindings.json
  #ln -snf ${TARGET_DIR}/settings/vscode/settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
}

setup_iterms () {
  local SCRIPT_DIR=$1
  local BACKUP_DIR=$2

  : backup
  if [ -f "${ORIGIN_BACKUP_DIR}/com.googlecode.iterm2.plist" ]; then
    cp "${HOME}/Library/Preferences/com.googlecode.iterm2.plist" "${BACKUP_DIR}/com.googlecode.iterm2.plist"
  else
    cp "${HOME}/Library/Preferences/com.googlecode.iterm2.plist" "${ORIGIN_BACKUP_DIR}/com.googlecode.iterm2.plist"
  fi
  : setup
  cp "${SCRIPT_DIR}/settings/darwin/com.googlecode.iterm2.plist" "${HOME}/Library/Preferences/com.googlecode.iterm2.plist"
}

: --------------------------------------------------
:  Main
: --------------------------------------------------
banner "${VERSION}" "${OS_TYPE}"

init

printf -- '  Install homebrew...\n';
install_homebrew

printf -- '  Install packages...\n';
install_packages

printf -- '  Set up neovim...\n';
setup_neovim

printf -- '  Set up VS Code...\n';
#setup_vscode "${BACKUP_DIR}"

printf -- '  Set up iTerms...\n';
setup_iterms "${SCRIPT_DIR}" "${BACKUP_DIR}"

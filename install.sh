#!/usr/bin/env bash
#===================================================================================
#
# FILE: install.sh
#
# USAGE: bash -c "$(curl -fsSL dot.shinichihatano.net)"
#
# DESCRIPTION:
#===================================================================================

set -e


: ----------------------------------------------------------------------
: Constants
: ----------------------------------------------------------------------
readonly VERSION="0.0.1"
readonly DOT_WORK_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly DOT_DIR="${HOME}/.dotfiles"

readonly ESC=$(printf '\033')


: ----------------------------------------------------------------------
: Functions
: ----------------------------------------------------------------------
banner() {
  printf -- "\n"
  printf -- "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n\n"
  printf -- "  DOTFILES\n"
  printf -- "  %s\n\n" "${VERSION}"
  printf -- "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n\n"
}

clone() {
  local TARGET_DIR=$1

  printf -- '  Clonning the dotfiles repository... \n\n';
  if [ ! -d "${TARGET_DIR}" ]; then
    git clone https://github.com/rising1008/dotfiles.git "${TARGET_DIR}"
  else
    echo "    ${ESC}[33mdotfiles already exists!${ESC}[m"
  fi
  printf -- '    done. \n\n';
}

macos() {
  local TARGET_DIR=$1

  printf -- '  Setting the macos... \n\n';
  bash "${TARGET_DIR}/settings/darwin/.macos"
  printf -- '    done. \n\n';

}

application() {
  local TARGET_DIR=$1

  printf -- '  Install homebrew... \n\n';
  [ ! -z `type -p brew` ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew bundle --file "${TARGET_DIR}/settings/darwin/Brewfile"

  cp "${TARGET_DIR}"/settings/darwin/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
  ln -snf "${TARGET_DIR}"/settings/darwin/config/nvim "${HOME}"/.config/nvim
  [ -d "${HOME}"/.cache/dein/repos/github.com/Shougo/dein.vim ] || curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > "${HOME}"/installer.sh
  [ -d "${HOME}"/.cache/dein/repos/github.com/Shougo/dein.vim ] || sh "${HOME}"/installer.sh "${HOME}"/.cache/dein
  printf -- '    done. \n\n';
}

user() {
  local TARGET_DIR=$1

  for f in "${TARGET_DIR}"/settings/darwin/*;
  do
      [[ "${f##*/}" == "Brewfile" ]] && continue
      [[ "${f##*/}" == ".Brewfile.lock.json" ]] && continue
      [[ "${f##*/}" == ".macos" ]] && continue
      [[ "${f##*/}" == ".config" ]] && continue
      [[ "${f##*/}" == "com.googlecode.iterm2.plist" ]] && continue

      ln -snf "$f" "$HOME/.${f##*/}"
  done
}

: ----------------------------------------------------------------------
: Main
: ----------------------------------------------------------------------
banner

clone "${DOT_DIR}"
macos "${DOT_DIR}"
application "${DOT_DIR}"
user "${DOT_DIR}"

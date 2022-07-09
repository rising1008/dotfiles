#!/usr/bin/env bash
#===================================================================================
#
# FILE: install.sh
#
# USAGE: install.sh
#
# DESCRIPTION: 
#===================================================================================

set -e


#----------------------------------------------------------------------
# Constants
#----------------------------------------------------------------------
readonly DOT_WORK_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly DOT_DIR="${HOME}/.dotfiles"

spin() {
  local i=0
  local sp='/-\|'
  local n=${#sp}
  printf ' '
  sleep 0.1
  while true; do
    printf '\b%s' "${sp:i++%n:1}"
    sleep 0.1
  done
}

sanitycheck() {
  echo "$1"
  spin = $1
  : for git
  if [ -z `type -p git` ]; then
      printf -- '\e[31mNG\e[m\n'
      printf -- "    You don\'t seem to have git installed.\n"
      printf -- '    Install it: xcode-select --install\n'
  fi
  kill $spin
}

printf -- "\n\e[34;1mDOTFILES\e[m \e[02m------------------------------\e[m\n"
printf -- "  processing install processes...\n\n"
#----------------------------------------------------------------------
# Sanity Check
#----------------------------------------------------------------------
printf -- "  [0] Sanity Check : "
#spin & spinpid=$!
#sanitycheck "$spinpid"
#kill "$spinpid"
#printf -- "\bOK\n"

#exit 0

#----------------------------------------------------------------------
# Main
#----------------------------------------------------------------------

printf -- 'Clonning the dotfiles repository... \n';
: Clone a repository of dotfiles
if [ ! -d ${DOT_DIR} ]; then
  git clone https://github.com/rising1008/dotfiles.git ${DOT_DIR}
else
  echo "  dotfiles already exists!"
fi

bash ${DOT_DIR}/settings/darwin/.macos

: Install Homebrew
[ ! -z `type -p brew` ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

: Install Formulas
brew bundle --file ${DOT_DIR}/settings/darwin/Brewfile

for f in ${DOT_DIR}/settings/darwin/*;
do
    [[ "${f##*/}" == "Brewfile" ]] && continue
    [[ "${f##*/}" == ".Brewfile.lock.json" ]] && continue
    [[ "${f##*/}" == ".macos" ]] && continue
    [[ "${f##*/}" == ".config" ]] && continue
    [[ "${f##*/}" == "com.googlecode.iterm2.plist" ]] && continue

    ln -snf "$f" "$HOME/.${f##*/}"
done

ln -snf ${DOT_DIR}/settings/darwin/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
ln -snf ${DOT_DIR}/settings/darwin/config/nvim ${HOME}/.config/nvim

: Setup Vim
printf -- "[6] Set Up NeoVim.\n"
[ -d ${HOME}/.cache/dein/repos/github.com/Shougo/dein.vim ] || curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ${HOME}/installer.sh
[ -d ${HOME}/.cache/dein/repos/github.com/Shougo/dein.vim ] || sh ${HOME}/installer.sh ${HOME}/.cache/dein

printf -- "    finished install.\n"

printf -- "\n\e[02m---------------------------------------\e[m\n"

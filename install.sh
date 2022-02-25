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
DOT_WORK_DIR="$(cd "$(dirname "$0")"; pwd)"
DOT_DIR="${HOME}/.dotfiles"


#----------------------------------------------------------------------
# Main
#----------------------------------------------------------------------

: Clone a repository of dotfiles
if [ ! -d ${DOT_DIR} ]; then
  if [ ! -z `type -p git` ]; then
    git clone https://github.com/rising1008/dotfiles.git ${DOT_DIR}
  else
    printf -- 'You don\'t seem to have git installed.\n;
    printf -- 'Install it: xcode-select --install\n'
    exit 127
  fi
else
  echo "dotfiles already exists"
fi

#${DOT_DIR}/settings/darwin/.macos

: Install Homebrew
[ ! -z `type -p brew` ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

: Install Formulas
brew bundle --file ${DOT_DIR}/settings/darwin/Brewfile

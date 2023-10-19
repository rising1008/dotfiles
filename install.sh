#!/usr/bin/env bash

: --------------------------------------------------
: Constraints
: --------------------------------------------------
VERSION="0.1.0"
OS_TYPE="$(uname -s)"
TIMESTAMP=$(date "+%Y%m%d-%H%M%S")
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
BACKUP_DIR="${HOME}/.backup/${TIMESTAMP}"
ORIGIN_BACKUP_DIR="${HOME}/.backup/origin"

readonly VERSION
readonly OS_TYPE
readonly TIMESTAMP
readonly SCRIPT_DIR
readonly BACKUP_DIR
readonly ORIGIN_BACKUP_DIR

: --------------------------------------------------
: Load libs
: --------------------------------------------------
source "${SCRIPT_DIR}/lib/utils.sh"

: --------------------------------------------------
: Functions
: --------------------------------------------------
banner() {
    p "\n  dotfiles _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n" "info"
    p "\n" "info"
    p "  VERSION: ${1}\n" "info" "info"
    p "  OS_TYPE: ${2}\n" "info" "info"
    p " _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n" "info"
    p "\n" "info"
}

function init() {
    local origin_backup_dir
    local backup_dir

    origin_backup_dir=$1
    backup_dir=$2

    if [[ ! -d ${origin_backup_dir} ]]; then
        p "  Create ${origin_backup_dir} directory.\n" "info"
        mkdir -p "${origin_backup_dir}"
    fi

    if [[ ! -d ${backup_dir} ]]; then
        p "  Create ${backup_dir} directory.\n" "info"
        mkdir -p "${backup_dir}"
    fi
}

install_homebrew() {
    [ ! -z $(type -p brew) ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_packages() {
    brew bundle --file "${SCRIPT_DIR}/settings/darwin/Brewfile"
    : install imgcat command
    [ -f "${SCRIPT_DIR}/bin/imgcat" ] || curl https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat >"${SCRIPT_DIR}/bin/imgcat"
    [ -f "${SCRIPT_DIR}/bin/imgcat" ] && chmod 755 "${SCRIPT_DIR}/bin/imgcat"
}

setup_neovim() {
    if [[ ! -d ~/.config/nvim ]]; then
        ln -snf "${SCRIPT_DIR}/settings/nvim" "${HOME}/.config/nvim"
    fi
}

setup_zsh() {
    if [[ ! -L ${HOME}/.zshrc ]]; then
        ln -snf "${SCRIPT_DIR}/settings/zsh/.zshrc" "${HOME}"
    fi

    if [[ ! -L ${HOME}/.zshenv ]]; then
        ln -snf "${SCRIPT_DIR}/settings/zsh/.zshenv" "${HOME}"
    fi

    if [[ ! -d ${HOME}/.zsh.d ]]; then
        ln -snf "${SCRIPT_DIR}/settings/zsh/.zsh.d" "${HOME}"
    fi
}

setup_vscode() {
    local BACKUP_DIR=$1

    : backup
    cp "${HOME}/Library/Application\ Support/Code/User/keybindings.json" "${BACKUP_DIR}/keybindings.json"
    cp "${HOME}/Library/Application\ Support/Code/User/settings.json" "${BACKUP_DIR}/settings.json"
    #ln -snf ${TARGET_DIR}/settings/vscode/keybindings.json ${HOME}/Library/Application\ Support/Code/User/keybindings.json
    #ln -snf ${TARGET_DIR}/settings/vscode/settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
    code --install-extension asvetliakov.vscode-neovim
    code --install-extension EditorConfig.EditorConfig
}

setup_iterms() {
    : backup
    if [ -f "${ORIGIN_BACKUP_DIR}/com.googlecode.iterm2.plist" ]; then
        cp "${HOME}/Library/Preferences/com.googlecode.iterm2.plist" "${BACKUP_DIR}/com.googlecode.iterm2.plist"
    else
        cp "${HOME}/Library/Preferences/com.googlecode.iterm2.plist" "${ORIGIN_BACKUP_DIR}/com.googlecode.iterm2.plist"
    fi
    : setup
    cp "${SCRIPT_DIR}/settings/darwin/com.googlecode.iterm2.plist" "${HOME}/Library/Preferences/com.googlecode.iterm2.plist"
}

setup_git() {
    ln -snf "${SCRIPT_DIR}/settings/git/.gitconfig" "${HOME}"
}

setup_macos() {
    ${SCRIPT_DIR}/bin/.macos
}

function setup_tmux() {
    ln -snf "${SCRIPT_DIR}/settings/darwin/.tmux.conf" "${HOME}/.tmux.conf"
}

: --------------------------------------------------
: Main
: --------------------------------------------------
banner "${VERSION}" "${OS_TYPE}"

init "${ORIGIN_BACKUP_DIR}" "${BACKUP_DIR}"

p '  Install homebrew...\n' 'info'
install_homebrew

p '  Install packages...\n' 'info'
install_packages

p '\n  Set up zsh...\n'
# setup_zsh

printf -- '  Set up neovim...\n'
# setup_neovim

printf -- '  Set up iTerms...\n'
# 設定ファイルの場所を指定することで対応
# setup_iterms "${SCRIPT_DIR}" "${BACKUP_DIR}"

printf -- '  Set up tmux...\n'
#setup_tmux
printf -- '  Set up git...\n'
#setup_git

# printf -- '  Set up VS Code...\n';
# setup_vscode "${BACKUP_DIR}"

printf -- '  Set up Mac OS...\n'
# setup_macos

# s-hata's dotfiles

> Warning
>
> 本dotfilesは、個人的な利用のみを想定したものです。
>

## Pre-Requisite

  - [Git](https://git-scm.com/)
    - OS Xの場合は、Xcode command line tools で入れてしまうのが手っ取り早いかも。
  - Sign in own Apple ID
  - SIgn in App Store

```
[Xcode command line tools インストール]
$ xcode-select --install
```

## Installation

```
$ bash -c "$(curl -fsSL dot.shinichihatano.net)"
```

## Post-Installation

### fzf

```
$ $(brew --prefix)/opt/fzf/install

Downloading bin/fzf ...
  - Already exists
  - Checking fzf executable ... 0.29.0
Do you want to enable fuzzy auto-completion? ([y]/n) y
Do you want to enable key bindings? ([y]/n) y

Generate /Users/shin/.fzf.bash ... OK
Generate /Users/shin/.fzf.zsh ... OK

Do you want to update your shell configuration files? ([y]/n) n <-- すでに設定済み

Update /Users/shin/.bashrc:
  - [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    ~ Skipped

Update /Users/shin/.zshrc:
  - [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    - Already exists: line #4

For more information, see: https://github.com/junegunn/fzf
```

### NeoVim

プラグインが依存するアプリケーション、及び、言語ごとのライブラリのインストールが必要です。

#### OS X

以下は、Homebrewパッケージとインストールされます。

  - [Deno](https://deno.land/)

#### Python

対象のライブラリは、requirements.txtに記載の通りです。

  - [cfn-lint](https://github.com/aws-cloudformation/cfn-lint)
  - [neovim](https://pypi.org/project/neovim/)

## What's in it?

  - NeoVim
    - Use [dein.vim](https://github.com/Shougo/dein.vim) to manage vim plugins
    - Use [defx.nvim](https://github.com/Shougo/defx.nvim) to browse directories and files
  - tmux
  - Zsh
  - git
  - OS X

### Structures

```
dotfiles
├── bin/ # 自作スクリプトなどを格納
│   ├── .macos
│   └── 自作スクリプトなど
│
├── assets # 別リポジトリから取得
│
├── settings
│   ├── darwin
│   ├── git
│   ├── nvim
│   └── zsh
│
├── install.sh # dotfilesインストールスクリプト
└── README.md
```


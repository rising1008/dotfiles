dotfiles
========


Homebrew
--------

### フォントの管理 ###

フォントの検索
```
$ brew search font
```

fzf
---

```
$ $(brew --prefix)/opt/fzf/install [.dotfiles]

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


iTerm2
------

### ショートカット ###



NeoVim
------

### Plugins ###

#### fzf.vim ####

| コマンド | 説明                                              |
|:---------|:--------------------------------------------------|
| Files    | ファイルをインクリメンタルサーチする。            |
| GFiles   | git ls-files の結果をインクリメンタルサーチする。 |
| History  | 最近使ったファイルをインクリメンタルサーチする。  |
| Buffers  | 開いているバッファをインクリメンタルサーチする。  |
| Rg       | ripgrep結果をインクリメンタルサーチする。         |


Zsh
---

### ZLE(Zsh Line Editor) ###

* https://dev.classmethod.jp/articles/zsh-zle-introduction/

Nodebrew
--------

```
$ nodebrew setup
```


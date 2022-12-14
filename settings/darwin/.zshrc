autoload -Uz colors
colors

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
for file in ~/.{zsh_prompt,zsh_aliases,zsh_functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# set variables
export HOMEBREW_GITHUB_API_TOKEN=751410abc6c5551861eb7c1de3ff8a2b59463496
export PATH=$HOME/.dotfiles/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# eval "$(rbenv_init)"
# eval "$(gcloud_init)"

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 50% --reverse --border --preview "bat  --color=always --style=header,grid --line-range :100 {}"'
# ディレクトリ検索で選択した項目の配下の構成をプレビューに表示する
# Esc + c (on OS X)
export FZF_ALT_C_OPTS='--preview "tree -a -C {} | head -200"'
# ファイル検索で選択した項目の中身をプレビューに表示する
# set -x FZF_CTRL_T_OPTS  "--preview 'head -100 {}'"
export FZF_CTRL_T_OPTS='--height 80% --reverse --border --preview "bat  --color=always --style=header,grid --line-range :100 {}"'
export FZF_CTRL_R_OPTS='--height 50% --reverse'

eval "$(pyenv init -)"

source ~/.zsh.d/zshrc
source ~/.zsh.d/zsh_prompt
source ~/.zsh.d/zsh_fzf

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

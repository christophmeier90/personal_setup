#!/bin/zsh

source $(dirname $0)/aliases

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"


# Themes and plugins
export ZSH="/Users/christoph.meier/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

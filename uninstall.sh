#!/bin/zsh

set -e

SCRIPT_DIR="$( cd "$( dirname "${(%):-%N}" )" &>/dev/null && pwd )"

stow -d $SCRIPT_DIR/dotfiles -t $HOME -D aerospace
stow -d $SCRIPT_DIR/dotfiles -t $HOME -D powerlevel10k
stow -d $SCRIPT_DIR/dotfiles -t $HOME -D zshrc

rm -rf $HOME/.oh-my-zsh

brew uninstall aerospace bat fzf jq ripgrep ruff stow tldr tmux uv zoxide || true

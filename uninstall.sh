#!/bin/zsh

set -e

brew uninstall aerospace bat fzf jq ripgrep ruff tldr tmux uv zoxide || true

rm -rf $HOME/.oh-my-zsh

# Remove dotfiles
rm -rf $HOME/.zshrc_personal
rm -f $HOME/.p10k.zsh
rm -f $HOME/.fzf.zsh

# Remove personal zshrc entry from main .zshrc
SOURCE_LINE="source $HOME/.zshrc_personal"
sed -i '' "s#$(echo $SOURCE_LINE)# #g" $HOME/.zshrc



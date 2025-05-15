#!/bin/zsh

set -e

SCRIPT_DIR="$( cd "$( dirname "${(%):-%N}" )" &>/dev/null && pwd )"
cp $SCRIPT_DIR/dotfiles/.??* ~/

# Install Homebrew and packages
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # Homebrew
fi

brew install aerospace bat fzf jq ripgrep ruff tldr tmux uv zoxide

# Oh-my-zsh
ZSH= KEEP_ZSHRC=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Source personal config
grep -Fxq "source ~/.zshrc_personal" ~/.zshrc || echo "source ~/.zshrc_personal" >> ~/.zshrc

exec zsh
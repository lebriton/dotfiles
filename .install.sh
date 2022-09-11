#!/usr/bin/env bash

if [[ ! -d "$HOME/.dotfiles" ]]; then
  git clone --bare git@gitlab.com:bminusl/dotfiles.git $HOME/.dotfiles
  # or git clone --bare https://gitlab.com/bminusl/dotfiles.git $HOME/.dotfiles
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout main -f
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
fi

sudo apt-get update
sudo apt-get install -y \
  curl \
  fzf \
  git \
  npm \
  python3 \
  python3-pip \
  tmux \
  vim \
  wget
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
#nvm install node

sudo apt-get install -y \
  blueman \
  cbatticon \
  compton \
  dunst \
  feh \
  i3 \

# Required to 'make && sudo make install' suckless tools
# These are no present by default on Ubuntu 20.04 LTS
#sudo apt-get install -y libx11-dev libxft-dev libxinerama-dev

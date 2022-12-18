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
  python3 \
  python3-pip \
  tmux \
  vim \
  wget \

sudo apt-get install -y \
  compton \
  flameshot \
  i3 \
  rxvt-unicode \
  xbacklight \
  xfce4 \
  xfce4-goodies \

mkdir -p ~/workspace/{bin,projects}

sudo snap install codium --classic
# codium --list-extensions
echo "
eamodio.gitlens
emmanuelbeziat.vscode-great-icons
jdinhlife.gruvbox
MS-CEINTL.vscode-language-pack-fr
ms-python.python
shardulm94.trailing-spaces
vscodevim.vim
" | xargs -L 1 codium --force --install-extension

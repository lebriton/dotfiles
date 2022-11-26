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
  alsa-tools \
  arandr \
  blueman \
  btop \
  cbatticon \
  compton \
  dunst \
  flameshot \
  fonts-dejavu \
  gpaste \
  i3 \
  imagemagick \
  pulseaudio-utils \
  pavucontrol \
  rofi \
  rxvt-unicode \
  tint2 \
  xbacklight \
  xdotool \
  xss-lock \
  yad \
  yaru-theme-icon

mkdir -p ~/workspace/{bin,projects}

sudo apt-get install -y dh-autoreconf
if [[ ! -d "$HOME/workspace/projects/i3blocks" ]]; then
  cd ~/workspace/projects
  git clone https://github.com/vivien/i3blocks
  cd i3blocks
  ./autogen.sh
  ./configure
  make
  sudo make install
fi

# "Install" font
fc-cache

sudo snap install codium --classic
codium --install-extension jdinhlife.gruvbox --force
codium --install-extension MS-CEINTL.vscode-language-pack-fr --force
codium --install-extension vscodevim.vim --force

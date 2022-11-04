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
  emacs \
  fzf \
  git \
  python3 \
  python3-pip \
  tmux \
  vim \
  wget \

sudo apt-get install -y \
  btop \
  alsa-tools \
  arandr \
  blueman \
  cbatticon \
  compton \
  dunst \
  feh \
  flameshot \
  gpaste \
  i3 \
  pulseaudio-utils \
  pavucontrol \
  rofi \
  rxvt-unicode \
  slock \
  ttf-dejavu \
  xbacklight \
  xdotool \
  yad \

sudo apt-get install -y \
  yaru-theme-icon

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

mkdir -p ~/workspace/{bin,projects}

# Required to 'make && sudo make install' suckless tools
# These are no present by default on Ubuntu 20.04 LTS
sudo apt-get install -y libx11-dev libxft-dev libxinerama-dev

if [[ ! -d "$HOME/workspace/projects/dmenu" ]]; then
  cd ~/workspace/projects
  git clone https://gitlab.com/bminusl/dmenu.git
  cd dmenu
  make
  sudo make install
fi

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

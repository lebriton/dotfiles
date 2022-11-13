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

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

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

if [[ ! -d "$HOME/.wallpapers" ]]; then
  git clone https://gitlab.com/bminusl/wallpapers.git $HOME/.wallpapers
  (crontab -l || echo; echo "*/5 * * * * DISPLAY=:0 feh --bg-fill --randomize $(ls -d ~/.wallpapers/*.{jpg,png} | sort -R | head -1)" ) | crontab
else
  cd $HOME/.wallpapers
  git pull --rebase
fi

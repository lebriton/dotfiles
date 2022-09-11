#!/usr/bin/env bash

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

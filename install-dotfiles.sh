#!/usr/bin/env bash

# via http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install() {
  dotfile="$1"

  if [ -f "$HOME/$dotfile" -a ! -h "$HOME/$dotfile" ]
    then mv -v $HOME/$dotfile $HOME/$dotfile~
  fi
  if [ ! -e "$HOME/$dotfile" ]
    then ln -sv $SCRIPTPATH/$dotfile $HOME/$dotfile
  fi
}

install .bash_aliases
install .bashrc
install .gitconfig
install .screenrc
install .vimrc

# dotfiles

NB: git branches are used for host-specific configs.

## Installing

```
git clone --bare git@gitlab.com:bminusl/dotfiles.git ~/.dotfiles
# or
git clone --bare https://gitlab.com/bminusl/dotfiles.git ~/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout <branch-name>
dotfiles config --local status.showUntrackedFiles no
source ~/.bashrc
```

### bash

```
wget https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash -O .sensible.bash
```

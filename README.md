# dotfiles

## Installing

```
git clone --bare git@gitlab.com:bminusl/dotfiles.git ~/.dotfiles
# or
git clone --bare https://gitlab.com/bminusl/dotfiles.git ~/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout master
dotfiles config --local status.showUntrackedFiles no
source ~/.bashrc
```

## Pushing changes

```
dotfiles push origin master
```

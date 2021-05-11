# dotfiles

## Installing

```
git clone --bare git@gitlab.com:bminusl/dotfiles.git $HOME/.dotfiles
# or
git clone --bare https://gitlab.com/bminusl/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout master
source ~/.bashrc
```

## Pushing changes

```
dotfiles push origin main
```

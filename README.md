# dotfiles

## Installing

```
git clone --bare git@gitlab.com:bminusl/dotfiles.git $HOME/.dotfiles
# or
git clone --bare https://gitlab.com/bminusl/dotfiles.git $HOME/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout <branch-name>
dotfiles config --local status.showUntrackedFiles no
source ~/.bashrc
```

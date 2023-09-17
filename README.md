# dotfiles

## Installation

```bash
export GIT_DIR="$HOME/.dotfiles"
export WORK_TREE="$HOME"
git clone --bare git@github.com:lebriton/dotfiles.git "$GIT_DIR"
# git clone --bare https://github.com/lebriton/dotfiles.git "$GIT_DIR"
git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" checkout main -f
git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" config --local status.showUntrackedFiles no
```

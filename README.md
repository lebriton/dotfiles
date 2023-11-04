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

```bash
codium --install-extension mvllow.rose-pine
codium --install-extension MS-CEINTL.vscode-language-pack-fr
codium --install-extension PKief.material-icon-theme
codium --install-extension PKief.material-product-icons
codium --install-extension vscodevim.vim
codium --install-extension VSpaceCode.whichkey
```

- [Hack Font](https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip)

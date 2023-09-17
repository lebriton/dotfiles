#!/usr/bin/env bash

set -Eeuo pipefail

protocol="$1"

git_dir="$HOME/.dotfiles"
work_tree="$HOME"

if [[ -d "$git_dir" ]]; then
  echo -e "Folder $git_dir already exists.\nAborted"
  exit 1
fi

case "$protocol" in
  "ssh")
    (set -x; git clone --bare git@github.com:lebriton/dotfiles.git "$git_dir")
    break
    ;;
  "https")
    (set -x; git clone --bare https://github.com/lebriton/dotfiles.git "$git_dir")
    break
    ;;
  *)
    echo -e "Unknown protocol '$protocol'\nAborted"
    exit 1
esac

set -x

git --git-dir="$git_dir" --work-tree="$work_tree" checkout main -f
git --git-dir="$git_dir" --work-tree="$work_tree" config --local status.showUntrackedFiles no

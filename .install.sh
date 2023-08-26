#!/usr/bin/env bash

set -Eeuo pipefail

git_dir="$HOME/.dotfiles"
work_tree="$HOME"

if [[ -d "$git_dir" ]]; then
  echo -e "Folder $git_dir already exists.\nAborted"
  exit 1
fi

PS3='Protocol to use to clone the repository: '
options=("ssh" "https")
select opt in "${options[@]}"
do
  case $opt in
    "ssh")
      (set -x; git clone --bare git@gitlab.com:lebriton/dotfiles.git "$git_dir")
      break
      ;;
    "https")
      (set -x; git clone --bare https://gitlab.com/lebriton/dotfiles.git "$git_dir")
      break
      ;;
    *) echo "Invalid option $REPLY";;
  esac
done

set -x

git --git-dir="$git_dir" --work-tree="$work_tree" checkout main -f
git --git-dir="$git_dir" --work-tree="$work_tree" config --local status.showUntrackedFiles no

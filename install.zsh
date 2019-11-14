#!/usr/bin/env zsh
set -e

cd ${0:a:h}
DIR=$(pwd)
mkdir -pv bak
for rc in *rc gitconfig gitignore.global tmux.conf; do
  [ -e ~/.$rc ] && mv -v ~/.$rc bak/.$rc
  ln -sfv $DIR/$rc ~/.$rc
done

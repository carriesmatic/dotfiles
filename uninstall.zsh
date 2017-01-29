#!/usr/bin/env zsh
set -e

command -v stow >/dev/null 2>&1 || { echo "Please install GNU stow." >&2; exit 1;  }
stow --dir=${${(%):-%N}:A:h} --target=$HOME --delete git tmux vim zsh


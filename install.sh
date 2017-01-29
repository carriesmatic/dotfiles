#!/bin/sh
set -e

command -v stow >/dev/null 2>&1 || { echo "Please install GNU stow." >&2; exit 1;  }
stow --target=$HOME --ignore='install.sh'

# Install spf13-vim
# Note: do this after stow command so that we only install the vim plugins we want.
if [[ ! -d $HOME/.spf13-vim-3 ]]; then
    curl https://j.mp/spf13-vim3 -L -o - | sh
fi

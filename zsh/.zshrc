typeset -U path
typeset -U fpath

fpath=($(brew --prefix)/completions/zsh $fpath)

# zplug
export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_LOADFILE=$HOME/.zplug.packages.zsh
[ -d $ZPLUG_HOME ] || git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# Set iTerm2 tab color
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}
tab-color 19 26 34

# spaceship
SPACESHIP_NVM_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VI_MODE_SHOW=false

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Only store successful commands in history.
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1  }

# Other
export EDITOR=vim

# Setup rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Setup python virtualenv
gpip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
export PIP_REQUIRE_VIRTUALENV=true

# Setup z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# Aliases
alias j=z
alias reload="source ~/.zshrc"
alias up="cd .."

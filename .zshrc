typeset -U path

# zplug
export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_LOADFILE=$HOME/.zplug.packages.zsh
[ -d $ZPLUG_HOME ] || git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Other
export EDITOR=vim

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

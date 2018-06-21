# Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export EDITOR=vim

path=(~/.local/bin $path)

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias code='cd ~/code'
alias dl='cd ~/Downloads'
alias dot='cd ~/dotfiles'
alias g='git'

# zgen
ZGEN_HOME=~/.zgen
[ -d $ZGEN_HOME ] || git clone https://github.com/tarjoilija/zgen.git $ZGEN_HOME
source $ZGEN_HOME/zgen.zsh
unset ZGEN_HOME

if ! zgen saved; then
  # oh-my-zsh
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/zsh_reload

  # base16-shell
  zgen load chriskempson/base16-shell

  # pure
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  # zsh-completions
  zgen load zsh-users/zsh-completions

  # zsh-syntax-highlighting
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

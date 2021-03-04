# Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export EDITOR=vim
export LESS=-FRX

typeset -U path
path=(~/bin ~/.local/bin $path)

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Only store successful commands in history.
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1  }

# Aliases
alias dl='cd ~/Downloads'
alias dot='cd ~/dotfiles'
alias reload='source ~/.zshrc'
alias g='git'

# Disable oh-my-zsh auto update prompt.
DISABLE_AUTO_UPDATE=true

# zgen
ZGEN_DIR=~/.zgen
[ -d $ZGEN_DIR ] || git clone https://github.com/tarjoilija/zgen.git $ZGEN_DIR
source $ZGEN_DIR/zgen.zsh

if ! zgen saved; then
  # oh-my-zsh
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/zsh_reload

  # theme/prompt
  zgen load denysdovhan/spaceship-prompt spaceship

  # zsh-completions
  zgen load zsh-users/zsh-completions

  # zsh-syntax-highlighting
  zgen load zsh-users/zsh-syntax-highlighting

  # git
  zgen load wfxr/forgit
  zgen load zdharma/zsh-diff-so-fancy

  zgen save
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

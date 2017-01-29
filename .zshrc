# Where the zsh files reside
ZSH_FILES=$HOME/.zsh-files

# Load Antigen
source $ZSH_FILES/antigen/antigen.zsh

# Load lib files
antigen use oh-my-zsh

#
# Antigen Theme
#

antigen theme $ZSH_FILES/themes carriercat.zsh-theme

#
# Antigen Bundles
#

# oh-my-zsh
# antigen bundle heroku
antigen bundle tmux
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Git
antigen bundle git
# antigen bundle git-flow

# SSH
antigen bundle ssh-agent

# Node
# antigen bundle coffee
# antigen bundle node
# antigen bundle npm

# Python
# antigen bundle pip
# antigen bundle python
# antigen bundle virtualenv

# OSX
# antigen bundle osx
antigen bundle brew
# antigen bundle brew-cask
# antigen bundle gem

# Other bundles
antigen bundle rupa/z

# Tell antigen that you're done
antigen apply

# Customize path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/X11/bin

# Python binaries
export PATH=$PATH:/usr/local/lib/python2.7/site-packages

# Other
export PGHOST=localhost
export GIT_EDITOR=vim

# Key timeout
KEYTIMEOUT=1

# You may want to put all your additions into a separate file like
# ~/.zsh_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# For "sensitive"/computer-specific aliases
if [ -f ~/.private_zsh_aliases ]; then
    . ~/.private_zsh_aliases
fi

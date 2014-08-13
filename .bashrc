[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -r /sw/bin/init.sh && . /sw/bin/init.sh

##
# Your previous /Users/carriercat/.profile file was backed up as /Users/carriercat/.profile.macports-saved_2012-02-09_at_20:13:12
##

# MacPorts Installer addition on 2012-02-09_at_20:13:12: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

alias la="ls -la"

# Change directories
alias school="cd ~/Documents/Berkeley/"
alias gamescrafters="cd ~/Documents/Berkeley/Spring\ 2013/GamesCrafters/"
alias cs161="cd ~/Documents/Berkeley/Spring\ 2013/CS161/"
alias cs164="cd ~/Documents/Berkeley/Spring\ 2013/CS164/"
alias ee122="cd ~/Documents/Berkeley/Fall\ 2012/EE122/"
alias cs160="cd ~/Documents/Berkeley/Fall\ 2012/CS160/"
alias cs188="cd ~/Documents/Berkeley/Fall\ 2012/CS188/"
alias msdosx="cd ~/Documents/Berkeley/Fall\ 2012/MSDOSX/"
alias proj="cd ~/Documents/Projects/"
alias p164="cd ~/Documents/Projects/CS164/proj/cs164sp13/pa9"

# SSH shortcuts
alias ssh-cs61b="ssh cs61b-qq@shay.cs.berkeley.edu"
alias ssh-cs170="ssh cs170-op@shay.cs.berkeley.edu"
alias ssh-decal="ssh cs198-jb@shay.cs.berkeley.edu"
alias ssh-ee122="ssh ee122-ca@nova.cs.berkeley.edu"
alias ssh-msdosx="ssh cs198-ca@star.cs.berkeley.edu"
alias ssh-cs188="ssh cs188-an@nova.cs.berkeley.edu"
alias ssh-cs161="ssh cs161-go@nova.cs.berkeley.edu"
alias ssh-cs164="ssh cs164-ch@nova.cs.berkeley.edu"

# Terminal Shortcuts
alias g="git"
alias ack="ack-5.12"
alias gits="git status"
alias gitc="git commit"
alias gitl="git log"
alias swipl="/opt/local/bin/swipl"

# Refresh shell
alias reload="source ~/.profile"

# Change prompt color
PS1_OLD=${PS1}
export PS1='\[\033[0;94m\]\u\[\033[0m\] \[\033[0;35m\]at\[\033[0m\] \[\033[0;94m\]$(scutil --get ComputerName)\[\033[0m\] \[\033[0;35m\]in\[\033[0m\] \[\033[0;94m\]\W\[\033[0m\] （=´∇｀=） '

# Add color ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Search for something in the current directory and in subdirectories
alias search="find . -type f | sed 's/.*/\"&\"/' | xargs grep"


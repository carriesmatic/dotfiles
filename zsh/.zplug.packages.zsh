zplug "chriskempson/base16-shell", use:"scripts/base16-ir-black.sh"
zplug "junegunn/fzf", use:"shell/*.zsh", on:"junegunn/fzf-bin", \
    hook-load:"export FZF_DEFAULT_OPTS='--exact'"
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux", on:"junegunn/fzf-bin", \
    hook-load:"export FZF_TMUX=1"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "mafredri/zsh-async", on:"sindresorhus/pure"
zplug "sindresorhus/pure"
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

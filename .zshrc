source $HOME/src/github/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle command-not-found

# others
antigen bundle kubectl

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme crunch

# Tell antigen that you're done.
antigen apply

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# make unslow
#function git_prompt_info() {
#    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}

unsetopt beep
unsetopt hist_beep
unsetopt list_beep

alias l='ls -la'
alias e='emacsclient -t'
alias k='kubectl'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source /home/filip/.config/broot/launcher/bash/br

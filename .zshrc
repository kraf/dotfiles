source $HOME/src/github/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle command-not-found

antigen bundle asdf

# others
# antigen bundle kubectl

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme crunch
antigen theme romkatv/powerlevel10k

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

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# 
# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias branchlist="git for-each-ref --sort='-authordate' --format='%1B[0;34m%(refname:short)%1B[m ===> %1B[1;35m%(subject)' refs/heads | sed -e 's-refs/heads/--'"
function branches() {
  local branch_name=$(branchlist | fzf --ansi -m)

  if [[ $branch_name ]]; then
    echo $branch_name | awk '{print $1}' | xargs git checkout
  fi
}

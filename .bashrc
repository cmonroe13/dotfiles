# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Make ls use colors
export CLICOLOR=1

# Make grep use colors
export GREP_OPTIONS='--color=auto'

CYAN='\[\e[0;36m\]'

PS1="$CYAN\w > \[$(tput sgr0)\]"

[ -s "/usr/local/etc/bash_completion" ] && source "/usr/local/etc/bash_completion"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm

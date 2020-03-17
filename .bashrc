# If not running interactively, don't do anything
[ -z "$PS1" ] && return

RED='\[\e[0;31m\]'
PS1="$RED\w (BASH)> \[$(tput sgr0)\]"

[ -s "/usr/local/etc/bash_completion" ] && source "/usr/local/etc/bash_completion"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

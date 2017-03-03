[ -e "$HOME/.uberc" ] && source "$HOME/.uberc"

# Make ls use colors
export CLICOLOR=1

# Make grep use colors
export GREP_OPTIONS="--color=auto"

export HISTFILE="$HOME/.zshistory"
export HISTSIZE=100
export SAVEHIST=1000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

bindkey -v

[ ! -d "$HOME/.zplug" ] && curl -sL zplug.sh/installer | zsh

source "$HOME/.zplug/init.zsh"

# Self manage does not play well with commands
# zplug "zplug/zplug", hook-build:"zplug --self-manage"

# FASD
fasd_init_zsh="$HOME/.fasd_init_zsh"
zplug "clvv/fasd", \
    as:command, \
    use:fasd

# Fuzzy Find
zplug "junegunn/fzf", \
    dir:"$HOME/.fzf", \
    hook-build:"zsh $HOME/.fzf/install --all"

# Autosuggestion bundle.
zplug "zsh-users/zsh-autosuggestions"

# Syntax highlighting bundle.
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Theme
zplug "miekg/lean"
zplug "chriskempson/base16-shell", use:"scripts/base16-eighties.sh", defer:0

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

if zplug; then
    zplug load #--verbose
fi

eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
alias v="f -e vim" # quick opening files with vim

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/Users/corymonroe/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

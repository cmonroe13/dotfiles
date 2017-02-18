[ -e "$HOME/.uberc" ] && source "$HOME/.uberc"

# Make ls use colors
export CLICOLOR=1

# Make grep use colors
export GREP_OPTIONS="--color=auto"

bindkey -v

[ ! -d "$HOME/.zplug" ] && curl -sL zplug.sh/installer | zsh

source "$HOME/.zplug/init.zsh"

# Self manage does not play well with commands
# zplug "zplug/zplug", hook-build:"zplug --self-manage"

# FASD
zplug "clvv/fasd"
eval "$(fasd --init auto)"
alias v="f -e vim" # quick opening files with vim

# Fuzzy Find
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

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

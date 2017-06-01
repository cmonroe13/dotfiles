alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

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

[ ! -d "$HOME/.zplug" ] && \
  curl -sL --proto-redir -all,https \
  https://zplug.sh/installer | zsh

[ ! -f "$HOME/.vim/autoload/plug.vim" ] && \
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

source "$HOME/.zplug/init.zsh"

# Self manage does not play well with commands
# zplug "zplug/zplug", hook-build:"zplug --self-manage"

# fasd
fasd_init_zsh="$HOME/.fasd_init_zsh"
zplug "clvv/fasd", \
  as:command, \
  use:fasd

# fzf
zplug "peco/peco", \
  as:command, \
  from:gh-r

# Fuzzy Find
zplug "junegunn/fzf", \
  dir:"$HOME/.fzf", \
  hook-build:"bash $HOME/.fzf/install --all"

# nvm
zplug "creationix/nvm", \
  dir:"$HOME/.nvm", \
  hook-build:"bash $HOME/.nvm/install.sh"

# peco
zplug "peco/peco", \
  from:"gh-r", \
  as:command, \
  rename-to:peco, \
  use:"*linux*amd64*"

# rg
zplug "BurntSushi/ripgrep", \
  from:"gh-r", \
  as:command, \
  rename-to:rg, \
  use:"*x86_64*linux*"

# Autosuggestion bundle.
zplug "zsh-users/zsh-autosuggestions"

# Syntax highlighting bundle.
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Theme
export PROMPT_LEAN_VIMODE=true
zplug "miekg/lean", \
  at:4e33a1f

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

eval \
  "$(fasd --init \
  posix-alias \
  zsh-hook \
  zsh-ccomp \
  zsh-ccomp-install \
  zsh-wcomp \
  zsh-wcomp-install)"

alias v="f -e vim" # quick opening files with vim

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt \
  %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/Users/corymonroe/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

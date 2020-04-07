PLATFORM=$(uname -s)

if [[ $PLATFORM:l = 'darwin' ]]; then
  alias ls='ls -G'
  alias la='ls -a -G'
  alias ll='ls -la -G'
  alias grep='grep -G'
  alias fgrep='fgrep -G'
  alias egrep='egrep -G'
elif [[ $PLATFORM:l = 'linux' ]]; then
  alias ls='ls --color=auto'
  alias la='ls -a --color=auto'
  alias ll='ls -la --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

export HISTFILE="$HOME/.zshistory"
export HISTSIZE=1000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# The following lines were added by compinstall

zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt \
 -  %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename $HOME/.zshrc

autoload -Uz compinit
compinit

# End of lines added by compinstall

bindkey -v

autoload -z edit-command-line
zle -N edit-command-line

[ ! -f "$HOME/.vim/autoload/plug.vim" ] && \
  curl -sfSL --proto-redir -all,https \
  -o "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ ! -d "$HOME/.zplug" ] && \
  curl -sfSL --proto-redir -all,https \
  https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | \
  zsh

[ ! -d "$HOME/.cargo" ] && \
  curl -sfSL --proto-redir -all,https \
  https://sh.rustup.rs | \
  sh

[ ! -d "$HOME/.go" ] && \
  curl -sfSL --proto-redir -all,https \
  https://dl.google.com/go/go1.13.3.$PLATFORM:l-amd64.tar.gz | \
  tar -C $HOME -xz && \
  mv $HOME/go $HOME/.go

[ ! -f "$HOME/go/bin/dlv" ] && \
  go get -u github.com/go-delve/delve/cmd/dlv

[ ! -f "$HOME/go/bin/goimports" ] && \
  go get golang.org/x/tools/cmd/goimports

[ ! -f "$HOME/go/bin/gopls" ] && \
  GO111MODULE=on go get golang.org/x/tools/gopls@latest

source "$HOME/.zplug/init.zsh"

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "tmux-plugins/tpm", \
  dir:"$HOME/.tmux/plugins/tpm"

zplug "junegunn/fzf", \
  dir:"$HOME/.fzf", \
  hook-build:"bash $HOME/.fzf/install --all"

zplug "pyenv/pyenv-installer", \
  hook-build:"[ ! -d $HOME/.pyenv ] && bash bin/pyenv-installer"

zplug "lukechilds/zsh-nvm"

zplug "clvv/fasd", \
  as:command, \
  use:fasd

zplug "grailbio/bazel-compilation-database", \
  as:command, \
  use:generate.sh, \
  rename-to:bazel-compdb

zplug "stedolan/jq", \
  from:gh-r, \
  as:command, \
  rename-to:jq

zplug "peco/peco", \
  from:gh-r, \
  as:command, \
  rename-to:peco

zplug "BurntSushi/ripgrep", \
  from:gh-r, \
  as:command, \
  rename-to:rg

zplug "sharkdp/bat", \
  from:gh-r, \
  as:command, \
  use:"*x86_64*$PLATFORM:l*.tar.gz"

zplug "sharkdp/fd", \
  from:gh-r, \
  as:command

zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "subnixr/minimal"

zplug "chriskempson/base16-shell", use:"scripts/base16-eighties.sh", defer:0

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load #--verbose

eval "$(fasd --init auto)"
alias v="f -e vim" # quick opening files with vim

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

kitty + complete setup zsh | source /dev/stdin

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.nimble/bin:$PATH"

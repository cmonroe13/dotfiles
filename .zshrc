alias ls=lsd

PLATFORM=$(uname -s)

if [[ $PLATFORM:l = 'darwin' ]]; then
  OS=macos
  alias la='ls -a -G'
  alias ll='ls -la -G'
  alias grep='grep -G'
  alias fgrep='fgrep -G'
  alias egrep='egrep -G'
elif [[ $PLATFORM:l = 'linux' ]]; then
  OS=linux
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

#bindkey -v

autoload -z edit-command-line
zle -N edit-command-line

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

[ ! -f "$HOME/.vim/autoload/plug.vim" ] && \
  curl -sfSL --proto-redir -all,https \
  -o "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ ! -d "$HOME/.zinit" ] && \
  curl -sfSL --proto-redir -all,https \
  https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh | \
  sh

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

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light @zinit-zsh/z-a-bin-gem-node

zinit lucid load for \
  pick"scripts/base16-embers.sh" \
    @chriskempson/base16-shell \
  from"gh-r" sbin \
    @starship/starship \
  pick"fasd" sbin \
    @clvv/fasd \
  from"gh-r" mv"fnm* -> fnm" sbin"fnm/fnm" \
    @Schniz/fnm \
  as"null" atclone"bash bin/pyenv-installer" atpull"%atclone" \
    @pyenv/pyenv-installer \
  as"null" atclone"bash install --all" atpull"%atclone" \
    @junegunn/fzf

zinit wait as"null" lucid load for \
  mv"generate.sh -> bazel-compdb" sbin \
    @grailbio/bazel-compilation-database \
  sbin \
    @tmux-plugins/tpm

zinit wait as"null" from"gh-r" lucid load for \
  mv"ripgrep* -> ripgrep" sbin"ripgrep/rg" \
    @BurntSushi/ripgrep \
  mv"peco* -> peco" sbin"peco/peco" \
    @peco/peco \
  mv"lsd* -> lsd" sbin"lsd/lsd" \
    @Peltoche/lsd \
  mv"bat* -> bat" sbin"bat/bat" \
    @sharkdp/bat \
  mv"fd* -> fd" sbin"fd/fd" \
    @sharkdp/fd \
  mv"jq* -> jq" sbin \
    @stedolan/jq \
  bpick"*$OS-full.tar.gz" mv"spotifyd* -> spotifyd" sbin \
    @Spotifyd/spotifyd \
  mv"spotify-tui* -> spt" sbin \
    @Rigellute/spotify-tui

zinit wait lucid load for \
  atinit"zicompinit; zicdreplay" \
    @zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    @zsh-users/zsh-autosuggestions

eval "$(starship init zsh)"

eval "$(fasd --init auto)"
alias v="f -e vim"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fnm env --multi)"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.workrc ] && source ~/.workrc

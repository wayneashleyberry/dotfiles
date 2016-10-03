# These settings have shamelessly been stolen from oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/completion.zsh
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Go
export GOPATH=$HOME

# Rust
export CARGOPATH=$HOME/.cargo

# PATH (Homebrew, Go, Rust etc)
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin:$CARGOPATH/bin

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Browsing
alias l="tree --dirsfirst -aFCNL 1"
alias ll="tree --dirsfirst -aChFupDLg 1"

# Naviation
alias gg='cd $(git rev-parse --show-toplevel)'

# Git
alias g='git'
alias br='git checkout -b'
alias gs='git status -sb'
alias gca='git commit -am'

# Node Modules
alias gh='git open' # https://github.com/paulirish/git-open
alias rm='trash' # https://github.com/sindresorhus/trash-cli

# Google Play
play() {
    open "https://play.google.com/music/listen?u=0#/sr/${*:gs/ /+}"
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*"'

fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -maxdepth 3 -prune -o -type d -print 2> /dev/null | grep -v 'node_modules' | grep -v 'vendor' | fzf +m) &&
  cd "$dir"
}

fe() {
  local declare files=($(fzf --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Pure
PURE_CMD_MAX_EXEC_TIME=10

source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-syntax-highlighting

# Hipster prompt symbols
PROMPT='%(?.%F{magenta}△.%F{red}▲)%f '

# Greeting Message
echo ""
$GOPATH/bin/dailyverse -pad

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

# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/history.zsh
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Go
export GOPATH=$HOME

# PATH (Homebrew, Go, Rust, Composer etc)
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Preferred editor for local and remote sessions
alias vi="nvim"
export EDITOR='nvim'

# Browsing
alias l="tree --dirsfirst -aFCNL 1"
alias ll="tree --dirsfirst -aChFupDLg 1"

# Naviation
alias gg='cd $(git rev-parse --show-toplevel)'
alias ..='cd ..'
alias ...='cd ../..'

# Git
alias br='git checkout -b'
alias gs='git status -sb'
alias gca='git commit -am'

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Node Modules
alias gh='git open' # https://github.com/paulirish/git-open

# Google Play
play() {
    open "https://play.google.com/music/listen?u=0#/sr/${*:gs/ /+}"
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--prompt="△ "'

# fd is like cd, but fuzzy
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -maxdepth 3 -prune -o -type d -print 2> /dev/null | grep -v 'node_modules' | grep -v 'vendor' | fzf +m) &&
  cd "$dir"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
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

# This makes things work...
autoload -U compinit && compinit

# Bitch, please.
bindkey -v

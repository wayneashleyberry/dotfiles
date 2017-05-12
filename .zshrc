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
export GOPATH=$HOME/go

# PATH (Homebrew, Go, Rust, Composer etc)
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Preferred editor for local and remote sessions
alias vi="nvim"
export EDITOR='nvim'

alias code="code-insiders"

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

# Compile and run a java file
jr() {
	javac $1.java && java $1
}

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Node Modules
alias gh='git open' # https://github.com/paulirish/git-open

# Google Cloud Functions
# ----------------------
# Unfortunately zsh ships with a built in `functions` function, so to be able to
# use the npm module it must be aliased to something else.
# https://github.com/GoogleCloudPlatform/cloud-functions-emulator
alias fn='/usr/local/bin/functions'

# Download YouTube a playlist, with each video's index in the filename.
alias ydl="youtube-dl -o '%(playlist_index)s - %(title)s.%(ext)s'"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--prompt="△ "'

# fd is like cd, but fuzzy
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -maxdepth 3 -prune -o -type d -print 2> /dev/null | grep -v 'Downloads' | grep -v 'Dropbox' | grep -v 'Library' | grep -v 'Music' | grep -v 'node_modules' | grep -v 'vendor' | fzf +m) &&
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

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# Pure
PURE_CMD_MAX_EXEC_TIME=10

source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-syntax-highlighting

# GCP

secrets(){
 export JWT_SECRET=`kubectl get secret over-jwt -o yaml | grep jwt.encryption.secret | tr -d 'jwt.encryption.secret: ' | tr -d '==' | base64 --decode`
 export JWT_SALT=`kubectl get secret over-jwt -o yaml | grep jwt.salt | tr -d 'jwt.salt: ' | tr -d '==' | base64 --decode`
}

alias gcloud-dev="gcloud auth activate-service-account --key-file ~/.secrets/over/gcloud/dev-client-secret.json && gcloud container clusters get-credentials over-api-dev-2 --zone us-east1-d --project over-services-dev"
alias gcloud-stg="gcloud auth activate-service-account --key-file ~/.secrets/over/gcloud/staging-client-secret.json && gcloud container clusters get-credentials over-api-staging-3 --zone us-east1-d --project over-services"
alias gcloud-prd="gcloud auth activate-service-account --key-file ~/.secrets/over/gcloud/prod-client-secret.json"

eval "$(rbenv init -)"

# This makes things work...
autoload -U compinit && compinit

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# JAVA :/

# export CLASS_PATH=$HOME/.ivy2/cache
# CLASS_PATH=$CLASS_PATH:$HOME/src/github.com/overhq/over-core-api
# CLASS_PATH=$CLASS_PATH:$HOME/src/github.com/overhq/over-circles-api

PROMPT='%(?.%F{magenta}❯.%F{red}!)%f '

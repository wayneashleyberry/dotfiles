DOTFILES=~/src/github.com/wayneashleyberry/dotfiles

# PATH (Homebrew, Go, Rust, Composer etc)
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Dotfile Node Modules
PATH=$PATH:$DOTFILES/node_modules/.bin

# Use NeoVim instead of vim
alias vi="nvim"
export EDITOR='nvim'

# VS Code
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

alias gh='gh-home'

# Google Cloud Functions
# ----------------------
# Unfortunately zsh ships with a built in `functions` function, so to be able to
# use the npm module it must be aliased to something else.
# https://github.com/GoogleCloudPlatform/cloud-functions-emulator
alias fn='functions-emulator'

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
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# Antibody Plugins
source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle < $DOTFILES/plugins.txt

# GCP

# This makes things work...
autoload -U compinit && compinit

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

PROMPT='%(?.%F{magenta}❯.%F{red}!)%f '

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh
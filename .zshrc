export DOTFILES=~/src/github.com/wayneashleyberry/dotfiles
export EDITOR='nvim'
export GOPATH=~/go

# Use some parts of oh-my-zsh
source $DOTFILES/lib/completion.zsh
source $DOTFILES/lib/history.zsh
source $DOTFILES/lib/clipboard.zsh

# Homebrew, Go, Rust, Composer etc
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Dotfile packages
PATH=$PATH:$DOTFILES/node_modules/.bin

# Aliases
alias ../..='cd ../..'
alias ..='cd ..'
alias br='git checkout -b'
alias code="code-insiders"
alias gca='git commit -am'
alias gg='cd $(git rev-parse --show-toplevel)'
alias gh='gh-home'
alias gs='git status -sb'
alias l="tree --dirsfirst -aFCNL 1"
alias ll="tree --dirsfirst -aChFupDLg 1"

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
  dir=$(find ${1:-*} -path '*/\.*' -maxdepth 3 -prune -o -type d -print 2> /dev/null | grep -v 'node_modules' | grep -v 'vendor' | fzf +m) &&
  cd "$dir"
}

# Antibody Plugins
source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle < $DOTFILES/plugins.txt

# This makes things work...
autoload -U compinit && compinit

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Pure prompt tweaks
PROMPT='%(?.%F{magenta}❯.%F{red}!)%f '

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

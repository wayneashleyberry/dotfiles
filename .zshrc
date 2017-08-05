export TERM=xterm-256color
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
alias gca='git commit -am'
alias gg='cd $(git rev-parse --show-toplevel)'
alias gh='gh-home'
alias gs='git status -sb'
alias l="exa -1"
alias ll="exa --long --git"
alias y="yarn"

weather() {
  wttr=`curl -s wttr.in/Cape\ Town`
  echo $wttr | head -n 37
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fd is like cd, but fuzzy
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -maxdepth 3 -prune -o -type d -print 2> /dev/null | grep -v 'node_modules' | grep -v 'vendor' | fzf +m) &&
  cd "$dir"
}

# Antibody Plugins
source <(antibody init)
antibody bundle mafredri/zsh-async
# antibody bundle sindresorhus/pure
antibody bundle < $DOTFILES/plugins.txt

# This makes things work...
autoload -U compinit && compinit

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

[[ $TMUX = "" ]] && export TERM="xterm-256color"
[[ $TMUX != "" ]] && export TERM="screen-256color"

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

# Base16 Gruvbox dark, medium
# Author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)

_gen_fzf_default_opts() {

local color00='#282828'
local color01='#3c3836'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#d5c4a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#fb4934'
local color09='#fe8019'
local color0A='#fabd2f'
local color0B='#b8bb26'
local color0C='#8ec07c'
local color0D='#83a598'
local color0E='#d3869b'
local color0F='#d65d0e'

export FZF_DEFAULT_OPTS="
  --height 40% --border
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts

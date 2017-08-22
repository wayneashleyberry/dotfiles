export TERM=xterm-256color
export DOTFILES=~/src/github.com/wayneashleyberry/dotfiles
export EDITOR='nvim'
export GOPATH=~/go
# export PROMPT_TIME=`date`
# export RPROMPT='%F{242}$PROMPT_TIME%f'

# Use some parts of oh-my-zsh
source $DOTFILES/lib/completion.zsh
source $DOTFILES/lib/history.zsh
source $DOTFILES/lib/clipboard.zsh

# Homebrew, Go, Rust, Composer etc
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Dotfile packages
PATH=$PATH:$DOTFILES/node_modules/.bin

# Aliases
alias br='git checkout -b'
alias gca='git commit -am'
alias gg='cd $(git rev-parse --show-toplevel)'
alias gh='gh-home'
alias gs='git status -sb'
alias l='exa -1 -F --group-directories-first'
alias ll='exa --long --git --group-directories-first -F --time-style long-iso'
alias j='z'
alias vi='nvim'
alias vim='nvim'

weather() {
  wttr=`curl -s wttr.in/Cape\ Town`
  echo $wttr | head -n 37
}

export FZF_DEFAULT_OPTS='--no-bold --border --height=30%'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -maxdepth 3 -prune -o -type d -print 2> /dev/null | grep -v 'node_modules' | grep -v 'vendor' | fzf +m) &&
  cd "$dir"
}

hi() {
  weather=`curl -s wttr.in/Cape\ Town`

  nvim -c PlugUpdate -c qa!
  antibody update
  brew update
  brew upgrade
  brew prune
  brew cleanup
  clear
	date
	hr -
	goproverb
  hr -
  echo $weather | head -n 17
}

source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle < $DOTFILES/plugins.txt

autoload -U compinit && compinit

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

[[ $TMUX = "" ]] && export TERM="xterm-256color"
[[ $TMUX != "" ]] && export TERM="screen-256color"

. /usr/local/etc/profile.d/z.sh

# echo '%F{242}`goproverb`%f'
# export RPROMPT='%F{242}$PROMPT_TIME%f'

set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x GOPATH $HOME

# Paths
test -d /usr/local/sbin          ; and set PATH /usr/local/sbin $PATH
test -d /usr/local/bin           ; and set PATH /usr/local/bin $PATH
test -d ~/bin                    ; and set PATH ~/bin $PATH

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function l     ; tree --dirsfirst -aFCNL 1 $argv ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

# Abbreviations
abbr -a vi "nvim"
abbr -a vim "nvim"
abbr -a gg "cd (git rev-parse --show-toplevel)"
abbr -a gs "git status -sb"

# Prompt
function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
    if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME/src/github.com/|~/s/g/|" -e "s|^$HOME|~|")
    else
        echo '~'
    end
end

# Greeting Message
dailyverse

bindkey '^l' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '^H' beginning-of-line
bindkey '^L' end-of-line

BREW_PATHS='/opt/homebrew/bin:/opt/homebrew/sbin'
LOCAL_PATHS='/usr/local/bin:/usr/local/sbin'

# export COLORTERM='xterm-256color-italic'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin'
export PATH="$BREW_PATHS:$LOCAL_PATHS:$PATH"
# export TERM='xterm-256color-italic'
export VIRTUALENVWRAPPER_PYTHON='/opt/homebrew/bin/python3'
export VISUAL='mvim'
export WORKON_HOME="$HOME/.venvs"
# add env vars for OCaml
eval $(opam env)
export EDITOR='vim'
export GPG_TTY="$(tty)"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export PROJECT_HOME="$HOME/code"
export SAVEHIST=2048

fpath=(
    '/opt/homebrew/completions/zsh/_brew'
    '/opt/homebrew/completions/zsh/_brew_cask'
    ${fpath}
)

autoload -Uz compinit && compinit
autoload -Uz colors && colors
setopt promptsubst
PROMPT='%F{blue}%~%f
%F{magenta}❯%f '
RPROMPT="%F{red}%0(?..✗✗✗)%f"
PS2="%F{white}...%f "

alias dots="$(which git) --git-dir=$HOME/.dots --work-tree=$HOME"
alias v="$VISUAL $HOME/.vimrc"
alias z="$VISUAL $HOME/.zshrc"

alias ls='ls -FG'
alias ..='cd ..'
alias ...="source $HOME/.zshrc"
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias t='tree -C'
alias ta='tree -Ca'

alias b:='brew search'
alias b::='brew info'
alias bi='brew install'
alias bri='brew reinstall'
alias bud='brew update'
alias bug='brew upgrade'
alias brm='brew uninstall'
alias buu='brew update && brew upgrade'
alias bls='brew list'
alias bdoc='brew doctor'
alias bclean='brew cleanup -s'

alias p:='pip3 search'
alias p::='pip3 show'
alias pi='pip3 install'
alias prm='pip3 uninstall'
alias pu='pip3 install --upgrade'
alias puu='pip3 install --upgrade pip'
alias pls='pip3 list'

alias school="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/csusb"

zsh_root='/opt/homebrew/share'
. "${zsh_root}/zsh-autosuggestions/zsh-autosuggestions.zsh"
. "${zsh_root}/zsh-history-substring-search/zsh-history-substring-search.zsh"
. "${zsh_root}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. '/opt/homebrew/bin/virtualenvwrapper.sh'
. "${HOME}/.iterm2_shell_integration.zsh"

[ -f "/Users/nic/.ghcup/env" ] && . "/Users/nic/.ghcup/env" # ghcup-env


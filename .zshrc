bindkey '^l' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '^H' beginning-of-line
bindkey '^L' end-of-line

export PATH="$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
export TERM='xterm-256color-italic'
export COLORTERM='xterm-256color-italic'
export EDITOR='vim'
export VISUAL="mvim"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=2048
export VIRTUALENVWRAPPER_PYTHON='python3'
export WORKON_HOME="$HOME/.venvs"
export PROJECT_HOME="$HOME/code"
# add env vars for OCaml
eval $(opam env)

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

alias ..='cd ..'
alias ...="source $HOME/.zshrc"
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias ls='ls -FG'
alias t='tree -C'
alias ta='tree -Ca'

alias b:='brew search'
alias b::='brew info'
alias bi='brew install'
alias bri='brew reinstall'
alias bup='brew update'
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

zsh_root='/opt/homebrew/share'
. "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
. "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
. "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. '/opt/homebrew/bin/virtualenvwrapper.sh'

# functions
# ---------
fpath=(
    '/opt/homebrew/completions/zsh/_brew'
    '/opt/homebrew/completions/zsh/_brew_cask'
    "$HOME/.zsh_functions"
    ${fpath}
)
autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz newtex
autoload -Uz tex2pdf

# plugins
# -------
zsh_root='/opt/homebrew/share'
. "${zsh_root}/zsh-autosuggestions/zsh-autosuggestions.zsh"
. "${zsh_root}/zsh-history-substring-search/zsh-history-substring-search.zsh"
. "${zsh_root}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "${HOME}/.iterm2_shell_integration.zsh"

# env vars
# --------
local BREW_PATHS='/opt/homebrew/bin:/opt/homebrew/sbin'
local LOCAL_PATHS='/usr/local/bin:/usr/local/sbin'
export COLORTERM='truecolor'
export EDITOR='vim'
export GPG_TTY="$(tty)"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export PATH="$BREW_PATHS:$LOCAL_PATHS:$PATH"
export SAVEHIST=2048
export TERM='xterm-256color'
export VISUAL='mvim'

# prompt
# ------
setopt promptsubst
PROMPT='%F{blue}%~%f
%F{magenta}❯%f '
RPROMPT="%F{red}%0(?..✗✗✗)%f"
PS2="%F{white}...%f "

# keys
# ----
bindkey '^l' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '^H' beginning-of-line
bindkey '^L' end-of-line

# aliases
# -------
alias ls='ls -FG'
alias ..='cd ..'
alias ...="source $HOME/.zshrc"
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias t='tree -C'
alias ta='tree -Ca'
# for my dotfiles
alias dots="$(which git) --git-dir=$HOME/.dots --work-tree=$HOME"
alias v="$VISUAL $HOME/.vimrc"
alias z="$VISUAL $HOME/.zshrc"
# for homebrew
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
# for python
alias py='python3'
# for pip
alias pip='pip3'
alias p:='pip search'
alias p::='pip show'
alias pi='pip install'
alias prm='pip uninstall'
alias pu='pip install --upgrade'
alias puu='pip install --upgrade pip'
alias pls='pip list'

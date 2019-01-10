# Dominic Gomez
# ~/.zshrc

# =============================================================================

# Options
# -------

# Subject the prompt string to parameter expansion, command substitution, and
# arithmetic expansion.
setopt promptsubst

# =============================================================================

# Functions
# ---------

fpath=(
    '/usr/local/share/zsh-completions'
    '/usr/local/share/zsh/site-functions'
    "$HOME/.zfunc"
    ${fpath}
)

autoload -Uz compinit && compinit
autoload -Uz colors && colors
# Functions whose names end in 'info' are used to append information to the
# command prompt.
autoload -Uz branchinfo
autoload -Uz venvinfo

# =============================================================================

# Prompts
# -------

# ❯ = U+276F
# ✗ = U+2717
# Spacing between items in the command prompt is handled by each of the
# functions used to build it.
PROMPT='
%F{blue}%~%f%F{black}$(branchinfo)%f%F{green}$(venvinfo)%f
%F{magenta}❯%f '
RPROMPT="%F{red}%0(?..✗✗✗)%f"
# Copy Python.
PS2="%F{white}...%f "

# =============================================================================

# Environment Variables
# ---------------------

export PATH='/usr/local/bin':"$PATH"
export TERM='xterm-256color-italic'
# Zsh
export HISTFILE="$HOME/.zhist"
export HISTSIZE=1028
export SAVEHIST=128
# virtualenv & virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/devel"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='-p python3 --no-site-packages'
export VIRTUAL_ENV_DISABLE_PROMPT=1

# =============================================================================

# Aliases
# -------

alias ..='cd ..'
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias ls='ls -FG'
alias tree='tree -C'
# Dotfiles
alias ...="source $HOME/.zshrc"
alias dot="git --git-dir=$HOME/.dots --work-tree=$HOME"
alias g="$VISUAL $HOME/.gvimrc"
alias v="$VISUAL $HOME/.vimrc"
alias z="$VISUAL $HOME/.zshrc"
# Homebrew
alias bls='brew list'
alias b:='brew search'
alias b::='brew info'
alias bi='brew install'
alias bri='brew reinstall'
alias brm='brew uninstall'
alias bcl='brew cleanup'
alias bu='brew update'
alias buu='brew update && brew upgrade'
alias buuu='brew update && brew upgrade && brew cleanup'
alias bcheck='brew doctor'
# Pip
alias pls='pip list'
alias p:='pip search'
alias p::='pip show'
alias pi='pip install'
alias prm='pip uninstall'
alias puu='pip install --upgrade'

# =============================================================================

# External Scripts
# ----------------

pfx='/usr/local/share'
source "${pfx}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${pfx}/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${pfx}/zsh-autosuggestions/zsh-autosuggestions.zsh"

source '/usr/local/bin/virtualenvwrapper.sh'

# =============================================================================

# Bindings
# --------

bindkey '^P' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Dominic Gomez
# ~/.zshrc

# Options
# =======

# Subject the prompt string to parameter expansion, command substitution, and
# arithmetic expansion.
setopt promptsubst


# Functions
# =========

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


# Command Prompt
# ==============

# ANSI Color Codes
# -------------------------
# Name              FG  BG
# -------------------------
# Black             30  40
# Red               31  41
# Green             32  42
# Yellow            33  43
# Blue              34  44
# Magenta           35  45
# Cyan              36  46
# White             37  47
# Bright Black      90  100
# Bright Red        91  101
# Bright Green      92  102
# Bright Yellow     93  103
# Bright Blue       94  104
# Bright Magenta    95  105
# Bright Cyan       96  106
# Bright White      97  107
#
# *Use 0 to reset attributes*

# Spacing between items in the command prompt is handled by each of the
# functions used to build it.
# ❯ = U+276F
# ✗ = U+2717
PROMPT='
%~$(branchinfo)$(venvinfo)
❯ '
RPROMPT="%F{red}%0(?..✗✗✗)%f"
# Copy Python.
PS2="%F{white}...%f "


# Environment Variables
# =====================

export EDITOR='vim'
export HISTFILE="$HOME/.zhist"
export HISTSIZE=1028
# Prefer Homebrew's installation directory.
export PATH='/usr/local/bin':"$PATH"
export PROJECT_HOME="$HOME/devel"
export SAVEHIST=128
export TERM='xterm-256color-italic'
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='-p python3 --no-site-packages'
export VISUAL='mvim'
export WORKON_HOME="$HOME/.virtualenvs"


# Aliases
# =======

# General
# -------
alias ..='cd ..'
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias ls='ls -FG'
alias tree='tree -C'

# Dotfile Management
# ------------------
alias ...="source $HOME/.zshrc"
alias dot="git --git-dir=$HOME/.dots --work-tree=$HOME"
alias g="$VISUAL $HOME/.gvimrc"
alias v="$VISUAL $HOME/.vimrc"
alias z="$VISUAL $HOME/.zshrc"

# Homebrew
# --------
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
# ---
alias pls='pip list'
alias p:='pip search'
alias p::='pip show'
alias pi='pip install'
alias prm='pip uninstall'
alias puu='pip install --upgrade'

# Pipenv
# ------
alias penv='pipenv --python 3 install --dev jedi flake8; pipenv shell'
alias penvkill='pipenv --rm'
alias penvsh='pipenv shell'
alias penvls='pipenv graph'
alias penvi='pipenv install'
alias penvidev='pipenv install --dev'
alias penvrm='pipenv uninstall'
alias penvcl='pipenv clean'
alias penvu='pipenv lock'
alias penvuu='pipenv lock && pipenv sync'
alias penvcheck='pipenv check'


# External Scripts
# ================

pfx='/usr/local/share'
source "${pfx}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${pfx}/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${pfx}/zsh-autosuggestions/zsh-autosuggestions.zsh"

source '/usr/local/bin/virtualenvwrapper.sh'


# Bindings
# ========

bindkey '^P' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

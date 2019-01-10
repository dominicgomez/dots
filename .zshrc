# Dominic Gomez
# $HOME/.zshrc

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

# POSIX
export PATH='/usr/local/bin':"$PATH"
export TERM='xterm-256color-italic'
export EDITOR='vim'
export VISUAL='mvim'
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
alias ...="source $HOME/.zshrc"
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias ls='ls -FG'
alias tree='tree -C'
# Dotfiles
alias dot="git --git-dir=$HOME/.dots --work-tree=$HOME"
alias gc="$EDITOR $HOME/.gitconfig"
alias gcv="$VISUAL $HOME/.gitconfig"
alias gi="$EDITOR $HOME/.gitignore"
alias giv="$VISUAL $HOME/.gitignore"
alias gv="$EDITOR $HOME/.gvimrc"
alias gvv="$VISUAL $HOME/.gvimrc"
alias t="$EDITOR $HOME/.tmux.conf"
alias tv="$VISUAL $HOME/.tmux.conf"
alias v="$EDITOR $HOME/.vimrc"
alias vv="$VISUAL $HOME/.vimrc"
alias z="$EDITOR $HOME/.zshrc"
alias zv="$VISUAL $HOME/.zshrc"
# Homebrew
alias bls='brew list'
alias b:='brew search'
alias b::='brew info'
alias bi='brew install'
alias bri='brew reinstall'
alias brm='brew uninstall'
alias bu='brew update'
alias buu='brew update && brew upgrade'
alias bdoc='brew doctor'
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

pfx='/usr/local'

# Zsh
. "${pfx}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "${pfx}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
. "${pfx}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# virtualenvwrapper
. "${pfx}/bin/virtualenvwrapper.sh"

# =============================================================================

# Key Bindings
# ------------

bindkey '^P' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# vim: set et wrap sw=4 sts=4 ts=4 tw=79:

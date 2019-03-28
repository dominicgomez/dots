# Dominic Gomez
# $HOME/.zshrc

#


# Options
# -------
# Subject the prompt string to parameter expansion, command substitution, and
# arithmetic expansion.
setopt promptsubst

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
# Functions (written by me) whose names end in 'info' are used to append
# information to the command prompt.
autoload -Uz branchinfo
autoload -Uz venvinfo

# Prompts
# -------
# ❯ = U+276F
# Spacing between items in the command prompt is handled by each of the
# functions used to build it.
PROMPT='
%F{blue}%~%f%F{white}$(branchinfo)%f%F{green}$(venvinfo)%f
%F{magenta}❯%f '
# ✗ = U+2717
RPROMPT="%F{red}%0(?..✗✗✗)%f"
# Copy Python.
PS2="%F{white}...%f "

# Aliases
# -------
# General
alias ..='cd ..'
alias ...="source $HOME/.zshrc"
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias ls='ls -FG'
alias tree='tree -C'
# Dotfiles
alias dot="git --git-dir=$HOME/.dots --work-tree=$HOME"
alias gc="$VISUAL $HOME/.gitconfig"
alias gc_t="$EDITOR $HOME/.gitconfig"
alias gi="$VISUAL $HOME/.gitignore"
alias gi_t="$EDITOR $HOME/.gitignore"
alias gv="$VISUAL $HOME/.gvimrc"
alias gv_t="$EDITOR $HOME/.gvimrc"
alias t="$VISUAL $HOME/.tmux.conf"
alias t_t="$EDITOR $HOME/.tmux.conf"
alias v="$VISUAL $HOME/.vimrc"
alias v_t="$EDITOR $HOME/.vimrc"
alias vr="$VISUAL $HOME/.vrapperrc"
alias vr_t="$EDITOR $HOME/.vrapperrc"
alias z="$VISUAL $HOME/.zshrc"
alias z_t="$EDITOR $HOME/.zshrc"
# Homebrew
alias bls='brew list'
alias b:='brew search'
alias b::='brew info'
alias bi='brew install'
alias bri='brew reinstall'
alias brm='brew uninstall'
alias bu='brew update'
alias buu='brew update && brew upgrade'
# Pip
alias pls='pip list'
alias p:='pip search'
alias p::='pip show'
alias pi='pip install'
alias prm='pip uninstall'
alias puu='pip install --upgrade'

# External Scripts
# ----------------
pfx='/usr/local'
# virtualenvwrapper
. "${pfx}/bin/virtualenvwrapper.sh"
# Zsh
. "${pfx}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "${pfx}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
. "${pfx}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Key Bindings
# ------------
bindkey '^P' autosuggest-accept
bindkey '^ ' autosuggest-execute

# FIXME
# Using the up and down arrows to search zsh command history interferes with
# scrolling through python interpreter history, so use left and right instead.
# bindkey '^[[D' history-substring-search-up
# bindkey '^[[C' history-substring-search-down

# vim: set et wrap sw=4 sts=4 ts=4 tw=79:

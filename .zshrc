export EDITOR='vim'
export HISTFILE="$HOME/.zhist"
export HISTSIZE=1028
export SAVEHIST=128
export TERM='xterm-256color-italic'
export VISUAL='mvim'


setopt promptsubst


fpath=(
    '/usr/local/share/zsh-completions'
    '/usr/local/share/zsh/site-functions'
    # "$HOME/.zfunc"
    ${fpath}
)
autoload -Uz compinit && compinit
autoload -Uz colors && colors


PROMPT='
%F{blue}%~%f
%F{magenta}❯%f '
RPROMPT="%F{red}%0(?..✗✗✗)%f"
PS2="%F{white}...%f "


alias ..='cd ..'
alias ...="source $HOME/.zshrc"
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias ls='ls -FG'
alias tree='tree -C'

alias dot="git --git-dir=$HOME/.dots --work-tree=$HOME"
alias gc="$VISUAL $HOME/.gitconfig"
alias gi="$VISUAL $HOME/.gitignore"
alias gv="$VISUAL $HOME/.gvimrc"
alias t="$VISUAL $HOME/.tmux.conf"
alias v="$VISUAL $HOME/.vimrc"
alias z="$VISUAL $HOME/.zshrc"

alias bls='brew list'
alias b:='brew search'
alias b::='brew info'
alias bi='brew install'
alias bri='brew reinstall'
alias brm='brew uninstall'
alias bu='brew update'
alias buu='brew update && brew upgrade'

alias pls='pip list'
alias p:='pip search'
alias p::='pip show'
alias pi='pip install'
alias prm='pip uninstall'
alias puu='pip install --upgrade'
alias preq='pip freeze >requirements.txt'


pfx='/usr/local'
. "${pfx}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "${pfx}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
. "${pfx}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"


bindkey '^ ' autosuggest-execute


# vim:tw=79:ts=8:sts=4:sw=4:et:

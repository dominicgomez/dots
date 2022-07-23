export PATH="$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export TERM='xterm-256color-italic'
export COLORTERM='xterm-256color-italic'
export EDITOR='vim'
export VISUAL="mvim"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=2048
export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
export WORKON_HOME="$HOME/.venvs"
export PROJECT_HOME="$HOME/code"
eval $(opam env)

# FPATH:
fpath=(
    '/opt/homebrew/completions/zsh/_brew'
    '/opt/homebrew/completions/zsh/_brew_cask'
    ${fpath}
)

# PROMPTS:
autoload -Uz compinit && compinit
autoload -Uz colors && colors

setopt promptsubst

PROMPT='%F{blue}%~%f
%F{magenta}❯%f '
RPROMPT="%F{red}%0(?..✗✗✗)%f"
PS2="%F{white}...%f "

alias ..='cd ..'
alias ...="source $HOME/.zshrc"
alias e='exit'
alias grep='grep --color=auto'
alias la='ls -A'
alias ls='ls -FG'
alias t='tree -C'
alias ta='tree -Ca'

# edit config files
alias c="$VISUAL $HOME/.gitconfig"
alias i="$VISUAL $HOME/.gitignore"
alias v="$VISUAL $HOME/.vimrc"
alias z="$VISUAL $HOME/.zshrc"

alias dots="$(which git) --git-dir=$HOME/.dots --work-tree=$HOME"

# homebrew
alias mbrew="arch -arm64 /opt/homebrew/bin/brew"
alias mbuu='mbrew update && brew upgrade'
alias mbi='mbrew install'
alias mbri='mbrew reinstall'
alias mbls='mbrew list'
alias mb:='mbrew search'
alias mb::='mbrew info'
alias mbrm='mbrew uninstall'
alias mbdoc='mbrew doctor'
alias mbclean='mbrew cleanup -s'
# homebrew with Rosetta
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias ibuu="ibrew update && mbrew upgrade"
alias ibi="ibrew install"
alias ibri="ibrew reinstall"
alias ibls="ibrew list"
alias ib:="ibrew search"
alias ib::="ibrew info"
alias ibrm="ibrew uninstall"
alias ibdoc="ibrew doctor"
alias ibclean="ibrew cleanup -s"

# python & pip
alias py="python3"
alias pu="python3 -m pip install --upgrade"
alias pi="python3 -m pip install"
alias pls="python3 -m pip list"
alias prm="python3 -m pip uninstall"
alias p:="python3 -m pip search"
alias p::="python3 -m pip show"

# EXTERNAL SCRIPTS:
zsh_root='/opt/homebrew/share'
. "$zsh_root/zsh-autosuggestions/zsh-autosuggestions.zsh"
. "$zsh_root/zsh-history-substring-search/zsh-history-substring-search.zsh"
. "$zsh_root/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

. '/opt/homebrew/bin/virtualenvwrapper.sh'

# KEY BINDING:
bindkey '^j' autosuggest-accept
bindkey '^ ' autosuggest-execute

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true


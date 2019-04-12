# Dominic Gomez
# $HOME/.zshenv

# Environment variables.

# Golang
export GOPATH="$HOME/devel/go"
export GOROOT='/usr/local/opt/go/libexec'

# Virtualenv & Virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/devel"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='-p python3 --no-site-packages'
export VIRTUAL_ENV_DISABLE_PROMPT=1

# POSIX & Zsh
export HISTFILE="$HOME/.zhist"
export HISTSIZE=1028
export SAVEHIST=128
export EDITOR='vim'
export VISUAL='mvim'
export TERM='xterm-256color-italic'
export PATH="/usr/local/bin:$PATH:$GOPATH/bin:$GOROOT/bin:$HOME/.cargo/bin"

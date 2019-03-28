# Dominic Gomez
# $HOME/.zshenv

# The second file (after /etc/zshenv) sourced by zsh.


# Environment Variables
# ---------------------
# POSIX
export PATH='/usr/local/bin':"$PATH"
export TERM='xterm-256color-italic'
export EDITOR='vim'
export VISUAL='mvim'
# virtualenv & virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/devel"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='-p python3 --no-site-packages'
export VIRTUAL_ENV_DISABLE_PROMPT=1
# Zsh
export HISTFILE="$HOME/.zhist"
export HISTSIZE=1028
export SAVEHIST=128

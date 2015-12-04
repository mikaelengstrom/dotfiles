#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

export PATH="$HOME/.composer/vendor/bin:$PATH"

export EDITOR="vim"
export VISUAL="vim"

alias wpcreatesuperuser="wp user create mien mikael.engstrom@frojd.se --role=administrator --user_pass=asdf"

eval "$(pyenv init -)"

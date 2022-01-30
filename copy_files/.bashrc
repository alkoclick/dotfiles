#!/usr/bin/env bash

# This is a customized ~/.bashrc based on the default Linux Ubuntu one


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Let's be a simple human
export EDITOR=micro

# Brew first because other stuff may depend on brew-installed utils
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Fancy terminal stuff
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

# Load aliases from separate file
. ~/.bash_aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



## Custom completions
complete -C $(which terraform) terraform
# Linuxbrew is installed in its own user, so completions are not loaded by default
if type brew &>/dev/null; then
  for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
  	do
      [[ -f $COMPLETION ]] && source "$COMPLETION"
  	done
fi

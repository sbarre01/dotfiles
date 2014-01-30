#!/bin/bash

########################################################################
# Bash Interactive Shell Setup
########################################################################


# Import the shell agnostic environment config
source ~/.profile

# When running two bash windows, allow both to write to the history, not one stomping the other
shopt -s histappend

#PROMPT_COMMAND='history -a'

# Remove duplicates from bash history
# export HISTCONTROL="ignoredups"
# export HISTIGNORE="&:ls:[bf]g:exit"

# Keep multiline commands as one command in history
shopt -s cmdhist

# Load Matthew's Git bash prompt
source ~/.dotfiles/bash_gitprompt

# Load git bash completion
# TODO

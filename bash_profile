#!/bin/bash

########################################################################
# Bash Interactive Shell Setup
########################################################################


# Import the shell agnostic environment config
source ~/.profile

# Load bash options.
source ~/dotfiles/bash_options

#PROMPT_COMMAND='history -a'

# Remove duplicates from bash history
# export HISTCONTROL="ignoredups"
# export HISTIGNORE="&:ls:[bf]g:exit"

# Load Matthew's Git bash prompt
#source ~/dotfiles/bash_prompt
# Load my Git bash prompt
source ~/dotfiles/bash_prompt_current

# Load git bash completion
# TODO

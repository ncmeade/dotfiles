# Set vim command line editing
set -o vi

# ANSI color codes
color_off="\[\033[0m\]"
green="\[\033[0;32m\]"
orange="\[\033[0;33m\]"

# Prompt string
PS1="[${green}\u@\h${color_off}]-[${orange}\W${color_off}]"
PS1+='$(__git_ps1 "-[%s]")\$ '

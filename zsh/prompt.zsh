#!/bin/zsh

autoload -U colors && colors

if [[ "$(tput colors)" == "256" ]]; then
    # Make using 256 colors easier.
    source ~/.zsh/plugins/spectrum.zsh
    fg[orange]=$FG[009]
    fg[violet]=$FG[061]
else
    fg[orange]=$fg[yellow]
    fg[violet]=$fg[magenta]
fi

function PR_DIR() {
    # Show current directory relative to home.
    echo "%{$fg[orange]%}%1~%{$reset_color%}"
}

function PR_ERROR() {
    # Show an exclamation point if the previous command failed.
    echo "%(?..%(!.%{$fg[violet]%}.%{$fg[red]%})!%{$reset_color%} )"
}

PR_ARROW_CHAR=">"
PR_ARROW="%{$fg[violet]%}${PR_ARROW_CHAR}%{$reset_color%}"

PROMPT="$(PR_DIR) $(PR_ERROR)${PR_ARROW} "

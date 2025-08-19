#!/bin/zsh

autoload -U colors && colors

if [[ "$(tput colors)" == "256" ]]; then
    # Make using 256 colors easier.
    source "${HOME}/.zsh/spectrum.zsh"
    fg[rosepine_peach]=$FG[217]
    fg[rosepine_foam]=$FG[159]
    fg[rosepine_love]=$FG[210]
    fg[rosepine_iris]=$FG[183]
    fg[rosepine_pine]=$FG[108]
    fg[rosepine_gold]=$FG[186]
    fg[rosepine_subtle]=$FG[102]
else
    # Fallback for non-256 color terminals.
    fg[rosepine_peach]=$fg[yellow]
    fg[rosepine_foam]=$fg[blue]
    fg[rosepine_love]=$fg[red]
    fg[rosepine_iris]=$fg[magenta]
    fg[rosepine_pine]=$fg[green]
    fg[rosepine_gold]=$fg[yellow]
    fg[rosepine_subtle]=$fg[black]
fi

function PR_DIR() {
    # Show current directory relative to home in peach.
    echo "%{$fg[rosepine_peach]%}%1~%{$reset_color%}"
}

function PR_ERROR() {
    # Show an exclamation point if the previous command failed.
    echo "%(?..%(!.%{$fg[rosepine_iris]%}.%{$fg[rosepine_love]%})!%{$reset_color%} )"
}

PR_ARROW_CHAR=">"
PR_ARROW="%{$fg[rosepine_foam]%}${PR_ARROW_CHAR}%{$reset_color%}"

PROMPT="$(PR_DIR) $(PR_ERROR)${PR_ARROW} "

#!/bin/zsh

smite() {
    # For removing invalid commands from history.
    #
    # Taken from: https://esham.io/2025/05/shell-history
    setopt LOCAL_OPTIONS ERR_RETURN PIPE_FAIL

    local opts=( -I )
    if [[ $1 == "-a" ]]; then
        opts=()
    elif [[ -n $1 ]]; then
        print >&2 "Usage: smite [-a]"
        return 1
    fi

    fc -l -n $opts 1 | \
        fzf --no-sort --tac --multi | \
        while IFS='' read -r command_to_delete; do
            printf 'Removing history entry: "%s"\n' ${command_to_delete}
            local HISTORY_IGNORE="${(b)command_to_delete}"
            fc -W
            fc -p ${HISTFILE} ${HISTSIZE} ${SAVEHIST}
        done
}

alias aliases="nvim ~/.zsh/aliases.zsh && source ~/.zsh/aliases.zsh"
alias ls="ls --color"
alias cl="clear"
alias za="zathura"

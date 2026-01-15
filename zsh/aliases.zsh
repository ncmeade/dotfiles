tmux_dev_env () {
    # Launches a tmux session with multiple windows.
    #
    # Takes an optional session name argument.
    session_name=${1-dev}

    tmux new-session -d
    tmux rename ${session_name}
    tmux renamew 'main'
    tmux new-window -n 'note' -d
    tmux new-window -n 'remote' -d

    tmux attach -t ${session_name}
}


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
            fc -p $HISTFILE $HISTSIZE $SAVEHIST
        done
}


note () {
    # Opens the Markdown note file for today in Neovim if it exists. If it does not
    # exist, a new file is created.
    #
    # Each file is categorized using the ISO 8601 format (YYY-MM-DD).
    timestamp=$(date -I)

    # Extract year, month, and day
    year=${timestamp:0:4}
    month=${timestamp:5:2}
    day=${timestamp:8:2}

    note_dir="${HOME}/rs/note/${year}/${month}"

    if [[ ! -d "${note_dir}" ]]; then
        mkdir -p "${note_dir}" 
    fi

    if [ ! -f "${note_dir}/${day}.md" ]; then
        echo "# $(date -I)" > "${note_dir}/${day}.md"
    fi

    # Open at the last position
    nvim "+ normal G$" "${note_dir}/${day}.md" 
}


bugwarrior_pull () {
    # Pulls GitHub issues into Taskwarrior using Bugwarrior.
    echo "Running Bugwarrior dry-run pull."
    uv run --with bugwarrior bugwarrior pull --dry-run

    echo -n "Continue with actual pull? (Y/n): "
    read response
    response=${response:-Y}

    if [[ "$response" =~ ^[Yy]$ ]]; then
        uv run --with bugwarrior bugwarrior pull
    else
        echo "Aborted."
        return 1
    fi

    echo "Pull complete."
}


alias aliases="nvim ~/.zsh/aliases.zsh && source ~/.zsh/aliases.zsh"
alias ls="ls --color"
alias cl="clear"
alias za="zathura"

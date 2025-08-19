tmux_dev_environment () {
    # Launches a tmux session with multiple windows.
    # If a virtualenv exists in the current working directory, it will be activated
    # in all panes/windows.
    #
    # Takes an optional session name argument.
    session_name=${1-dev}

    tmux new-session -d
    tmux rename ${session_name}
    tmux renamew 'main'
    tmux new-window -n 'misc' -d
    tmux new-window -n 'remote' -d

    # Split windows.
    tmux split-window -h -v -p 50 -t 0. -d
    tmux split-window -h -v -p 50 -t 1. -d

    # Activate virtualenv.
    if [[ -d "./env" ]]; then
        tmux send-keys -t "${session_name}:0.0" "source env/bin/activate; clear" C-m
        tmux send-keys -t "${session_name}:0.1" "source env/bin/activate; clear" C-m
        tmux send-keys -t "${session_name}:1.0" "source env/bin/activate; clear" C-m
        tmux send-keys -t "${session_name}:1.1" "source env/bin/activate; clear" C-m
        tmux send-keys -t "${session_name}:2.0" "source env/bin/activate; clear" C-m

        # Start IPython, if available.
        if $(source "env/bin/activate" && command -v ipython >/dev/null 2>&1); then
            tmux send-keys -t "${session_name}:1.1" "ipython" C-m
        fi
    fi

    tmux attach -t ${session_name}
}


notes () {
    # Opens the Markdown notes file for today in Vim if it exists. If it does not
    # exist, a new file is created.
    #
    # Each file is named using the ISO 8601 format (YYY-MM-DD).
    timestamp=$(date -I)

    if [ ! -f "${HOME}/rs/note/${timestamp}.md" ]; then
        echo "# $(date -I)" > "${HOME}/rs/note/${timestamp}.md"
    fi

    # Open at the last position.
    nvim "+ normal G$" "${HOME}/rs/note/${timestamp}.md" 
}

# Open aliases for easy editing.
alias aliases="nvim ~/.zsh/aliases.zsh && source ~/.zsh/aliases.zsh"

alias ls="ls --color"
alias isort="isort --profile=black"
alias cl="clear"
alias za="zathura"

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

    # Split windows.
    tmux split-window -h -v -p 25 -t 0. -d
    tmux split-window -h -v -p 50 -t 1. -d

    # Activate virtualenv.
    if [[ -d "./env" ]]; then
        tmux send-keys -t "${session_name}:0.0" "source env/bin/activate; clear" C-m
        tmux send-keys -t "${session_name}:0.1" "source env/bin/activate; clear" C-m
        tmux send-keys -t "${session_name}:1.0" "source env/bin/activate; clear" C-m
        tmux send-keys -t "${session_name}:1.1" "source env/bin/activate; clear" C-m
    fi

    # Activate Ipython.
	if [ -x "$(command -v ipython)" ]; then
        tmux send-keys -t "${session_name}:1.1" "ipython" C-m
	fi

    tmux attach -t ${session_name}
}

function usage
    echo "tmux_load_or_new_session: session_name"
end

function tmux_load_or_new_session
    if [ (count $argv) != 1 ]
        usage
        return 1
    end

    set -l SESSION_NAME $argv[1]

    if tmux has-session -t $SESSION_NAME
        tmux attach -t $SESSION_NAME
    else
        tmux new -s $SESSION_NAME
    end
end

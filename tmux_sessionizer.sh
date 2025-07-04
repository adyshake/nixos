#!/usr/bin/env bash

trap 'echo "Interrupt found exiting"' 1 2 3 6 15

create_cmd="Create-dir"
work_dir="work"
personal_dir="personal"
oss_dir="personal/opensource"

session_cmd=$(find ~/work ~/personal ~/personal/opensource ~/personal/onest -maxdepth 1 2> /dev/null | xargs echo "$create_cmd" | tr " " "\n" | fzf)

# Exit if fzf was interrupted
if [ $? -ne 0 ]; then
    exit
fi

if [ "$session_cmd" = "$create_cmd" ]; then
    dest=$(echo "$work_dir $personal_dir $oss_dir" | tr " " "\n" | fzf)
    read -p "Project Name: " proj_dir

    session_dir="$HOME/$dest/$proj_dir"

    if [ ! -d "$session_dir" ]; then
        mkdir "$session_dir" 
    fi
else
    session_dir="$session_cmd"
fi

session=$(basename "$session_dir" | tr . -)

if ! tmux has-session -t "$session" 2> /dev/null; then
    tmux new-session -s "$session" -c "$session_dir" -d
fi

if [ "$TERM_PROGRAM" = tmux ]; then
    tmux switch-client -t "$session"
else
    tmux a -t "$session"
fi


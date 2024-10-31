#!/bin/bash

SESH="home-cfg"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "home"

	tmux send-keys -t $SESH:home "cd ~/.config/home-manager" C-m
	tmux send-keys -t $SESH:home "vi ." C-m

	tmux new-window -t $SESH -n "terminal"
	tmux send-keys -t $SESH:terminal "cd ~/.config/home-manager" C-m


	tmux new-window -t $SESH -n "config"
	tmux send-keys -t $SESH:config "cd ~" C-m
	tmux send-keys -t $SESH:config "cd /etc/nixos" C-m
	tmux send-keys -t $SESH:config "sudo vi configuration.nix" C-m

	tmux select-window -t 1
fi

tmux attach-session -t $SESH

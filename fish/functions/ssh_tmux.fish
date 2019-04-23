function ssh_tmux
    if tmux has-session; and test -n $SSH_CLIENT
	tmux new-session -A -t ssh_tmux
end

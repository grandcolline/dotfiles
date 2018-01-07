function fzf_pid_kill -d "select PID and kill"
	set -l ref ( \
		ps aux \
		| sed -e '1d' \
		| fzf --height 40% --reverse --exit-0 --tiebreak=index --prompt="Kill > " --query "$argv" \
		| awk '{print $2}' \
	)
	if [ "$ref" = "" ]
		echo "oh... PID kill MISS!"
	else
		kill $ref
		echo "Killed $ref"
	end
end


function __fzf_history -d "history search"
	set -l ref ( \
		history \
		| fzf --height 40% --reverse --exit-0 --tiebreak=index --prompt="History > " \
	)
	if [ "$ref" = "" ]
		echo "oh... history select MISS!"
		commandline -f repaint
	else
		commandline -i $ref
	end
end

function __fzf_history
	set -l ref ( \
		history \
		| fzf --height 40% --reverse --exit-0 --tiebreak=index \
			--bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' --prompt="History > " \
	)
	if [ "$ref" = "" ]
		commandline -f repaint
	else
		commandline -i $ref
	end
end

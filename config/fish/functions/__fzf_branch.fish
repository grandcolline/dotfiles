function __fzf_branch -d "search git branch"
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
		set -l ref ( \
			git branch -a \
			| sed -e "s;remotes/;;g" \
			| sed -e "/origin\/HEAD/d" \
			| fzf --height 40% --reverse --exit-0 --tiebreak=index --prompt="Branch > " \
			| tr -d ' ' \
			| tr -d '*' \
		)
		if [ "$ref" = "" ]
			echo "oh... branch select MISS!"
			commandline -f repaint
		else
			commandline -i $ref
		end
	else
		echo "no git directory!"
		commandline -f repaint
	end
end


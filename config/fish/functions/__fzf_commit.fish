function __fzf_commit -d "search git commit of this branch"
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
		set -l ref ( \
			git log --no-merges --date=short --pretty=format:'%h %ad %an: %d %s' \
			| fzf --height 40% --reverse --exit-0 --tiebreak=index --prompt="Commit >  "\
			| awk '{ print $1 }' \
		)
		if [ "$ref" = "" ]
			echo "oh... commit select MISS!"
			commandline -f repaint
		else
			commandline -i $ref
		end
	else
		echo "no git directory!"
		commandline -f repaint
	end
end


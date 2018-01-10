function __fzf_git_status -d "search git status"
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
		set -l ref ( \
			git status -s \
			| fzf --height 40% --reverse --exit-0 --tiebreak=index --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' --prompt="Status > " \
			| awk -F ' ' '{print $NF}' \
			| tr '\n' ' '
		)
		if [ "$ref" = "" ]
			commandline -f repaint
		else
			commandline -i $ref
		end
	else
		echo "no git directory!"
		commandline -f repaint
	end
end


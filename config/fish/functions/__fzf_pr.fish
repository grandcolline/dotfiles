function __fzf_pr
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1

		argparse -n __fzf_pr 'a/all' -- $argv
		or return 1

		set -l git_cmd "unbuffer gh pr list"
		set -l fzf_cmd "fzf --ansi --height 40% --reverse --exit-0 --tiebreak=index \
			--bind 'ctrl-y:execute-silent(echo {} | awk \'{ print $1 }\' | pbcopy)+abort'"

		set fzf_cmd "$fzf_cmd --prompt='PR > '"
		set -l ref ( eval $git_cmd | eval $fzf_cmd | awk '{ print $1 }' )
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


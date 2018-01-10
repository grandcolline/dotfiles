function __fzf_file

	argparse -n __fzf_file 'g/git' 'p/preview' -- $argv
	or return 1

	set -l ref ""
	set -l fzf_cmd "fzf --reverse --exit-0 --tiebreak=index --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'"

	if set -lq _flag_preview
		set fzf_cmd "$fzf_cmd --preview 'head -100 {}'"
	else
		set fzf_cmd "$fzf_cmd --height 40%"
	end

	if set -lq _flag_git
		if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
			echo "no git directory!"
			commandline -f repaint
			return
		end
		set fzf_cmd "$fzf_cmd --prompt='Git File > '"
		set ref ( \
			git ls-files \
			| eval $fzf_cmd
		)
	else
		set fzf_cmd "$fzf_cmd --prompt='File > '"
		set ref ( \
			find . -type f \
			| grep -v "\/\." \
			| sed -e "s-\./--g" \
			| eval $fzf_cmd
		)
	end

	if [ "$ref" = "" ]
		commandline -f repaint
	else
		commandline -i $ref

	end
end


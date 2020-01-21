function fzf_ripgrep -d "select directory and cd"
	set -l ref ( \
		rg -l "$argv" \
		| fzf --height 40% --reverse --exit-0 --tiebreak=index --tac --prompt="Rg > " --preview "unbuffer rg $argv {}" --preview-window down:5
	)
	if [ "$ref" = "" ]
		echo "MISS!"
	else
		echo -n $ref | pbcopy
		echo "copied!!"
	end
end


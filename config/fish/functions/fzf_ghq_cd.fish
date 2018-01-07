function fzf_ghq_cd -d "select git directory and cd"
	set -l ref ( \
		ghq list \
		| fzf --height 40% --reverse --exit-0 --tiebreak=index --prompt="GhqJump > " --query "$argv"
	)
	if [ "$ref" = "" ]
		echo "oh... GhqJump MISS!"
	else
		cd (ghq root)/$ref
	end
end


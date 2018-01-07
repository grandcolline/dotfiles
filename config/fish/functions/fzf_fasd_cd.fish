function fzf_fasd_cd -d "select directory and cd"
	set -l ref ( \
		fasd -d \
		| fzf --height 40% --reverse --exit-0 --tiebreak=index --tac --prompt="Jump > " --query "$argv" \
		| awk '{print $2}' \
	)
	if [ "$ref" = "" ]
		echo "oh... Jump MISS!"
	else
		cd $ref
	end
end


function __fzf_docker_container

	argparse -n __fzf_git_log 'a/all' -- $argv
	or return 1

	set -l docker_cmd "docker ps -a"
	set -l fzf_cmd "fzf --height 40% --reverse --exit-0 --tiebreak=index"

	if set -lq _flag_all
		set git_cmd "$git_cmd --all"
		set fzf_cmd "$fzf_cmd --prompt='All Container > '"
	else
		set fzf_cmd "$fzf_cmd --prompt='Container > '"
	end

	set -l ref ( eval $docker_cmd | awk 'NR>1 {print $1" : "$2" : "$NF}' |  eval $fzf_cmd | awk '{ print $1 }' )
	if [ "$ref" = "" ]
		commandline -f repaint
	else
		commandline -i $ref
	end

end


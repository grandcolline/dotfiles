function __fzf_docker_container

	argparse -n __fzf_docker_container 'a/all' 'i/ignore' -- $argv
	or return 1

	set -l docker_cmd "docker ps"
	set -l fzf_cmd "fzf --height 40% --reverse --exit-0 --tiebreak=index"

	if set -lq _flag_all
		set docker_cmd "$docker_cmd -a"
		set fzf_cmd "$fzf_cmd --prompt='All Container > '"
	else
		set fzf_cmd "$fzf_cmd --prompt='Container > '"
	end

	if set -lq _flag_ignore
		set docker_cmd "$docker_cmd | grep -v 'k8s_'"
	end

	set -l ref ( eval $docker_cmd | awk 'NR>1 {printf "%-15s %-40s %s\n", $1, $2, $NF}' |  eval $fzf_cmd | awk '{ print $1 }' )
	if [ "$ref" = "" ]
		commandline -f repaint
	else
		commandline -i $ref
	end

end


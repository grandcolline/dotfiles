function __fzf_docker_images

  argparse -n __fzf_docker_images 'a/all' 'i/ignore' -- $argv
  or return 1

  set -l docker_cmd "docker images"
  set -l fzf_cmd "fzf --height 40% --reverse --exit-0 --tiebreak=index"

  if set -lq _flag_all
    set docker_cmd "$docker_cmd -a"
    set fzf_cmd "$fzf_cmd --prompt='All Images > '"
  else
    set fzf_cmd "$fzf_cmd --prompt='Images > '"
  end

  if set -lq _flag_ignore
    set docker_cmd "$docker_cmd | grep -v -e'k8s.gcr.io/' -e 'docker/kube-compose-'"
  end

  set -l ref ( eval $docker_cmd | awk 'NR>1 {printf "%-40s %-15s %s\n", $1, $2, $3}' | eval $fzf_cmd | awk '{ print $3 }' )
  if [ "$ref" = "" ]
    commandline -f repaint
  else
    commandline -i $ref
  end

end


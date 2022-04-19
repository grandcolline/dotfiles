function __fzf_git_branch
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1

    argparse -n __fzf_git_branch 'a/all' -- $argv
    or return 1

    set -l git_cmd "git branch"
    set -l fzf_cmd "fzf --ansi --height 40% --reverse --exit-0 --tiebreak=index \
      --bind 'ctrl-y:execute-silent(echo {} | tr -d \' \' | tr -d \'*\' | pbcopy)+abort'"

    if set -lq _flag_all
      set git_cmd "$git_cmd --all"
      set fzf_cmd "$fzf_cmd --prompt='All Branch > '"
    else
      set fzf_cmd "$fzf_cmd --prompt='Branch > '"
    end

    set -l ref ( \
      eval $git_cmd \
      | sed -e "s;remotes/;;g" \
      | sed -e "/origin\/HEAD/d" \
      | eval $fzf_cmd \
      | tr -d ' ' \
      | tr -d '*' \
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


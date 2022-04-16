function __fzf_git_log
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1

    argparse -n __fzf_git_log 'a/all' -- $argv
    or return 1

    # set -l git_cmd "unbuffer git log --no-merges --date=short --pretty='format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s'"
    # set -l git_cmd "git log --no-merges --date=short --pretty=format:'%h %ad %an: %d %s'"
    set -l git_cmd "git log --no-merges --date=short --pretty='format:%h %cd %<(15)%cn%s'"
    set -l fzf_cmd "fzf --ansi --height 40% --reverse --exit-0 --tiebreak=index \
      --bind 'ctrl-y:execute-silent(echo {} | awk \'{ print $1 }\' | pbcopy)+abort'"

    if set -lq _flag_all
      set git_cmd "$git_cmd --all"
      set fzf_cmd "$fzf_cmd --prompt='All Commit > '"
    else
      set fzf_cmd "$fzf_cmd --prompt='Commit > '"
    end

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


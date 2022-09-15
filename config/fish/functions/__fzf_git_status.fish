function __fzf_git_status -d "search git status"
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l ref ( \
      unbuffer git -P status -s \
      | fzf --height 40% --reverse --exit-0 --tiebreak=index --ansi \
        --bind 'ctrl-y:execute-silent(echo {} | awk -F \' \' \'{print $NF}\' | pbcopy)+abort' \
        --prompt="Status > " \
      | awk -F ' ' '{print $NF}' \
      | tr '\n' ' '
    )

    commandline -f repaint
    commandline -i $ref
  else
    echo "no git directory!"
    commandline -f repaint
  end
end


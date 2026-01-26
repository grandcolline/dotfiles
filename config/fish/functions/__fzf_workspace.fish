function __fzf_workspace

  argparse -n __fzf_directory 'p/preview' -- $argv
  or return 1

  set -l ref ""
  set -l fzf_cmd "fzf --reverse --exit-0 --tiebreak=index \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'"

  if set -lq _flag_preview
    set fzf_cmd "$fzf_cmd --preview 'head -100 {}target/plan.md' --height 40%"
  else
    set fzf_cmd "$fzf_cmd --height 40%"
  end

  set fzf_cmd "$fzf_cmd --prompt='Workspace > '"
  set workspace (ls -d $WORKSPACE/*/ | eval $fzf_cmd)

  if test -d "$workspace/target"
    set ref (realpath "$workspace/target" 2>/dev/null)
  else
    set ref (realpath "$workspace" 2>/dev/null)
  end

  commandline -f repaint
  commandline -i "$ref"
end


function __fzf_directory

  argparse -n __fzf_directory 'z/zoxide' 'p/preview' -- $argv
  or return 1

  set -l ref ""
  set -l fzf_cmd "fzf --reverse --exit-0 --tiebreak=index \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'"

  # --- ワークスペース判定
  set -l current_id (get_current_workspace)
  set -l ws_root ""
  if test $status -eq 0
      set ws_root "$WORKSPACE/$current_id"
  end

  if set -lq _flag_preview
    set fzf_cmd "$fzf_cmd --preview 'tree -L 3 {}'"
  else
    set fzf_cmd "$fzf_cmd --height 40%"
  end

  if set -lq _flag_zoxide
    set fzf_cmd "$fzf_cmd --prompt='Zoxide Dir > '"
    if test -n "$ws_root"
      set ref (zoxide query -l | string match "$ws_root*" | eval $fzf_cmd)
    else
      set ref (zoxide query -l | eval $fzf_cmd)
    end
  else
    set fzf_cmd "$fzf_cmd --prompt='Dir > '"
    set ref (find . -type d | grep -v "\/\." | sed -e "s-\./--g" | eval $fzf_cmd)
  end

  commandline -f repaint
  commandline -i $ref
end


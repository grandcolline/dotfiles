function __fzf_directory

  argparse -n __fzf_directory 'f/fasd' 'z/zoxide' 'p/preview' -- $argv
  or return 1

  set -l ref ""
  set -l fzf_cmd "fzf --reverse --exit-0 --tiebreak=index \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'"

  if set -lq _flag_preview
    set fzf_cmd "$fzf_cmd --preview 'tree -L 3 {}'"
  else
    set fzf_cmd "$fzf_cmd --height 40%"
  end

  if set -lq _flag_fasd
    set fzf_cmd "$fzf_cmd --tac --prompt='Fasd Dir > '"
    set ref ( \
      fasd -d -l\
      | eval $fzf_cmd
    )
  else if set -lq _flag_zoxide
    set fzf_cmd "$fzf_cmd --prompt='Zoxide Dir > '"
    set ref ( \
      zoxide query -l\
      | eval $fzf_cmd
    )
  else
    set fzf_cmd "$fzf_cmd --prompt='Dir > '"
    set ref ( \
      find . -type d \
      | grep -v "\/\." \
      | sed -e "s-\./--g" \
      | eval $fzf_cmd
    )
  end

  commandline -f repaint
  commandline -i $ref
end


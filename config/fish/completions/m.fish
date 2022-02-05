function __complete_m
  #    set -l words (commandline -pco)
  #    set -l cword (count $words)
  if test -f ".my/script"
    .my/script "comp"
  end
end

complete -c m -xa '(__complete_m)'


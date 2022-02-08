function __complete_m
  set -l words (commandline -pco)
  set -l cword (count $words)

  if test -f ".my/script.mjs"
    switch $cword
      case 1
        .my/script.mjs "comp"
      case '*'
        __fish_complete_path
    end
  end
end

complete -c m -xa '(__complete_m)'


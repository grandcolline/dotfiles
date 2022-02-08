function __complete_m
  if not test -f ".my/script.mjs"
    return 1
  end

  set -l words (commandline -pco)
  set -l cword (count $words)

  switch $cword
    case 1
      .my/script.mjs "comp"
    case '*'
      __fish_complete_path
  end
end

complete -c m -xa '(__complete_m)'


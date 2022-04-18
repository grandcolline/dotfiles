function __complete_m

  if not type "zx" > /dev/null 2>&1
    return 1
  end

  if test -f ".my/script.mjs"
    set cmd ".my/script.mjs"
  else if test -f ".my/script.md"
    set cmd ".my/script.md"
  else
    return 1
  end

  set -l words (commandline -pco)
  set -l cword (count $words)

  switch $cword
    case 1
      zx $cmd "comp"
    case '*'
      __fish_complete_path
  end
end

complete -c m -xa '(__complete_m)'


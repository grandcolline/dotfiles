function __complete_m

  if not type "zx" > /dev/null 2>&1
    return 1
  end

  if test -f ".my/script.mjs"
    zx .my/script.mjs
  else if test -f ".my/script.md"
    zx .my/script.md
  else
    return 1
  end
end

complete -c m -n '__fish_use_subcommand' -xa '(__complete_m)'
complete -c m -n "__fish_seen_subcommand_from" -s o -r # FIXME: subcommnd_fromでいいのかわからない


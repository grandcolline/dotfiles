function m -d "Excute My Script!!"

  if not type "zx" > /dev/null 2>&1
    return 1
  end

  if test -f ".my/script.mjs"
    set cmd ".my/script.mjs"
  else if test -f ".my/script.md"
    set cmd ".my/script.md"
  else
    echo "can't find script file!"
    return 1
  end

  zx $cmd $argv
end

function m -d "Excute My Script!!"

  if not type "zx" > /dev/null 2>&1
    echo "fish: Unknown command: zx"
    return 1
  end

  if test -f ".my/script.mjs"
    zx .my/script.mjs $argv
  else if test -f ".my/script.md"
    zx .my/script.md $argv
  else
    echo "can't find script file!"
    return 1
  end
end

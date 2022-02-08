function m -d "Excute My Script!!"
  if not test -f ".my/script.mjs"
    echo "can't find script file!"
    return 1
  end

  .my/script.mjs $argv
end

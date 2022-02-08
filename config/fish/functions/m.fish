function m -d "Excute My Script!!"
  if test -f ".my/script.mjs"
    .my/script.mjs $argv
  else
    echo "no script file!!"
  end
end

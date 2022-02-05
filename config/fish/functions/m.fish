function m -d "Excute My Script!!"
  if test -f ".my/script"
    .my/script $argv
  else
    echo "no script file!!"
  end
end

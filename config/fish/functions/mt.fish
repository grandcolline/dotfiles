function mt -d "move to trash"
  mv $argv $HOME/.Trash/(string trim -r -c '/' $argv)_(env LANG=en_US.UTF-8 date "+%Y%m%d_%H%M%S")
end

function clone -d "git clone in WORKSPACE and move"
  set -l path ( echo "$argv" \
    | sed -e "s;https://;;g" \
    | sed -e "s;git@github.com:;github.com/;g" \
    | sed -e "s;git@gitlab.com:;gitlab.com/;g" \
    | sed -e 's/.git$//g' \
  )
  set -l ws (get_current_workspace)
  if test $status -ne 0
    set ws 0
  end
  set -l dest $WORKSPACE/$ws/$path
  git clone "$argv" $dest
  cd $dest
end

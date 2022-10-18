function clone -d "git clone in WORKSPACE and move"
  set -l path ( echo "$argv" \
    | sed -e "s;https://;;g" \
    | sed -e "s;git@github.com:;github.com/;g" \
    | sed -e "s;git@gitlab.com:;gitlab.com/;g" \
    | sed -e 's/.git$//g' \
  )
  git clone "$argv" $WORKSPACE/src/$path
  cd $WORKSPACE/src/$path
end

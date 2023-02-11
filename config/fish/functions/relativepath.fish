function relativepath -d "get relative path"
  set -l target (realpath $argv[1])

  set -l source
  if test -n "$argv[2]"
    set source (realpath $argv[2])
  else
    set source (pwd)
  end

  set -l common_part $source
  set -l back

  while test "$(string replace $common_part '' $target)" = "$target"
    set common_part (dirname $common_part)
    set back "../$back"
  end
  echo "$back$(string replace $common_part/ '' $target)"
end


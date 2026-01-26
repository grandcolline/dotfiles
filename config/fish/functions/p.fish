function p -d "Open plan.md in EDITOR"
  set -l git_root (git rev-parse --show-toplevel 2>/dev/null)
  if test -z "$git_root"
    echo "Not in a git repository"
    return 1
  end

  set -l ws (get_current_workspace)
  if test $status -ne 0
    echo "Not in a workspace"
    return 1
  end

  if test "$argv[1]" = "new"
    # $WORKSPACE/target -> git_root というシンボリックリンクを上書きして貼る
    if test -n "$WORKSPACE"
      ln -snf "$git_root" "$WORKSPACE/$ws/target"
    end

    # plan.md を "# " で作成
    echo "# " > "$git_root/plan.md"
  end

  $EDITOR $git_root/plan.md
end

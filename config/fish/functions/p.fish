function p -d "Open plan.md in EDITOR"
  set -l git_root (git rev-parse --show-toplevel 2>/dev/null)
  if test -z "$git_root"
    echo "Not in a git repository"
    return 1
  end

  set -l plan_file $git_root/plan.md

  if not test -e $plan_file
    set -l ws (get_current_workspace)
    if test $status -ne 0
      set ws 0
    end
    set -l workspace_plan $WORKSPACE/$ws/plan.md
    ln -s $workspace_plan $plan_file
  end

  $EDITOR $plan_file
end

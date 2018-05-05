# git

## alias

[alias](https://github.com/grandcolline/dotfiles/blob/master/config/git/alias)

branch (b)
|b|branch -a|
|bv|branch -a -vv|
|bd|branch -D|
|bm|branch -M|

pull (p)
|p|pull --rebase --prune --tags|

fetch (f)
|f|fetch --prune --tags|

merge (m)
|m|merge -v|
|ma|merge --abort|

rebase (rb)
|rb|rebase|
|rbi|rebase -i|
|rba|rebase --abort|
|rbc|rebase --continue|

push (po)
|po|push -u origin|
|pfopush --force-with-lease -u origin|

* [git push -f をやめて --force-with-lease を使おう - Qiita](https://qiita.com/wMETAw/items/5f47dcc7cf57af8e449f)

checkout (co)
|co|checkout|
|cob|checkout -b|
|cop|checkout -p|

cherry-pick (cp)
|cp|cherry-pick --ff|
|cpa|cherry-pick --abort|
|cpc|cherry-pick --continue|

revert (rv)
|rv|revert|
|rva|revert --abort|
|rvc|revert --continue|

add (ad)
|ad|add -v|
|ada|add -v -A|
|adp|add -p|

commit (cm)
|cm|commit -v|

reset (rs)
|rs|reset|
|rsp|reset -p|

status (s)
|s|status -sb|

diff (d)
|d|diff|
|ds|diff --stat|
|dc|diff --cached|

log (l)
|l|log --pretty=fuller --stat --decorate|
|lp|log -p -1 --stat --decorate|
|ll|log --no-merges --date=short --pretty='format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s'|
|lla|log --all --date=short --pretty='format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s'|
|lg|log --graph --date=short --format='%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n'|
|lga|log --graph --all --date=short --format='%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n'|
|lgb|log --graph --all --date=short --format='%C(white)%d%C(reset) %C(black)%ad%C(reset)'|

stash (st)
|st|stash|
|stl|stash list|
|sta|stash apply --index|
|std|stash drop|
|stp|stash pop --index|

submodule (sb)
|sbl|submodule status|
|sbu|submodule update --init --recursive|

skipworktree (sw)
|sw|update-index --skip-worktree|
|nsw|update-index --no-skip-worktree|
|swl|`git ls-files -v | grep --color=never 'S '`|


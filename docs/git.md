# git

## alias

* [alias file](https://github.com/grandcolline/dotfiles/blob/master/config/git/alias)

branch (b)

|alias|command|
|:-:|:-:|
|b|branch -a|
|bv|branch -a -vv|
|bd|branch -D|
|bm|branch -M|

pull (p)

|alias|command|
|:-:|:-:|
|p|pull --rebase --prune --tags|

fetch (f)

|alias|command|
|:-:|:-:|
|f|fetch --prune --tags|

merge (m)

|alias|command|
|:-:|:-:|
|m|merge -v|
|ma|merge --abort|

rebase (rb)

|alias|command|
|:-:|:-:|
|rb|rebase|
|rbi|rebase -i|
|rba|rebase --abort|
|rbc|rebase --continue|

push (po)

|alias|command|
|:-:|:-:|
|po|push -u origin|
|pfopush --force-with-lease -u origin|

* [git push -f をやめて --force-with-lease を使おう - Qiita](https://qiita.com/wMETAw/items/5f47dcc7cf57af8e449f)

checkout (co)

|alias|command|
|:-:|:-:|
|co|checkout|
|cob|checkout -b|
|cop|checkout -p|

cherry-pick (cp)

|alias|command|
|:-:|:-:|
|cp|cherry-pick --ff|
|cpa|cherry-pick --abort|
|cpc|cherry-pick --continue|

revert (rv)

|alias|command|
|:-:|:-:|
|rv|revert|
|rva|revert --abort|
|rvc|revert --continue|

add (ad)

|alias|command|
|:-:|:-:|
|ad|add -v|
|ada|add -v -A|
|adp|add -p|

commit (cm)

|alias|command|
|:-:|:-:|
|cm|commit -v|

reset (rs)

|alias|command|
|:-:|:-:|
|rs|reset|
|rsp|reset -p|

status (s)

|alias|command|
|:-:|:-:|
|s|status -sb|

diff (d)

|alias|command|
|:-:|:-:|
|d|diff|
|ds|diff --stat|
|dc|diff --cached|

log (l)

|alias|command|
|:-:|:-:|
|l|log --pretty=fuller --stat --decorate|
|lp|log -p -1 --stat --decorate|
|ll|log --no-merges --date=short --pretty='format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s'|
|lla|log --all --date=short --pretty='format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s'|
|lg|log --graph --date=short --format='%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n'|
|lga|log --graph --all --date=short --format='%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n'|
|lgb|log --graph --all --date=short --format='%C(white)%d%C(reset) %C(black)%ad%C(reset)'|

stash (st)

|alias|command|
|:-:|:-:|
|st|stash|
|stl|stash list|
|sta|stash apply --index|
|std|stash drop|
|stp|stash pop --index|

submodule (sb)

|alias|command|
|:-:|:-:|
|sbl|submodule status|
|sbu|submodule update --init --recursive|

skipworktree (sw)

|alias|command|
|:-:|:-:|
|sw|update-index --skip-worktree|
|nsw|update-index --no-skip-worktree|
|swl|`git ls-files -v | grep --color=never 'S '`|


# branch (b)
alias gb 'git branch -a'
alias gbv 'git branch -a -vv'
alias gbu 'git branch -u'
alias gbd 'git branch -D'
alias gbm 'git branch -M'

# pull (p)
alias gp 'git pull --rebase --prune --tags'

# fetch (f)
alias gf 'git fetch --prune --tags'

# merge (m)
alias gm 'git merge -v'
alias gma 'git merge --abort'

# rebase (rb)
alias grb 'git rebase'
alias grbi 'git rebase -i'
alias grba 'git rebase --abort'
alias grbc 'git rebase --continue'

# push (po)
alias gpo 'git push -u origin'
alias gpfo 'git push --force-with-lease -u origin'
alias gpffo 'git push -f -u origin'

# checkout (co)
alias gco 'git checkout'
alias gcob 'git checkout -b'
alias gcop 'git checkout -p'

# cherry-pick (cp)
alias gcp 'git cherry-pick --ff'
alias gcpa 'git cherry-pick --abort'
alias gcpc 'git cherry-pick --continue'

# revert (rv)
alias grv 'git revert'
alias grva 'git revert --abort'
alias grvc 'git revert --continue'

# add (ad)
alias gad 'git add -v'
alias gadp 'git add -p'

# commit (cm)
alias gcm 'git commit -v'
alias gcmm 'git commit -m'
alias gcma='git commit -v --amend --date="`date`"'
alias gn='git commit -am "[from now] `date`"' #git-now

# reset (rs)
alias grs 'git reset'
alias grsp 'git reset -p'

# status (s)
alias gs 'git status -sb'

# diff (d)
alias gd 'git diff'
alias gds 'git diff --stat'
alias gdc 'git diff --cached'

# log (l)
alias gl 'git log --pretty=fuller --stat --decorate'
alias glp 'git log -p -1 --stat --decorate'
alias gll 'git log --no-merges --date=short --pretty="format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s"'
alias glla 'git log --all --date=short --pretty="format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s"'
alias glg 'git log --graph --date=short --format="%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n"'
alias glga 'git log --graph --all --date=short --format="%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n"'
alias glgb 'git log --graph --all --date=short --format="%C(white)%d%C(reset) %C(black)%ad%C(reset)"'

# stash (st)
alias gst 'git stash'
alias gstl 'git stash list'
alias gsta 'git stash apply --index'
alias gstd 'git stash drop'
alias gstp 'git stash pop --index'

# submodule (sb)
alias gsbl 'git submodule status'
alias gsbu 'git submodule update --init --recursive'

# skipworktree (sw)
alias gsw='git update-index --skip-worktree'
alias gnsw='git update-index --no-skip-worktree'
alias gswl='git ls-files -v | grep --color=never "S "'

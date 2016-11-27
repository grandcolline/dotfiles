#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

##  たくさんあっても使いこなせないので、自分の使うもののみに...

# barnach (b)
alias gb='git branch -a'
alias gbv='git branch -a -vv'
alias gbd='git branch -D'
alias gbm='git branch -M'

# pull,fetch (p,f)
alias gp='git pull --rebase --prune --tags'
alias gf='git fetch --prune --tags'

# rebase (rb)
alias grb='git rebase'
alias grbi='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

# push (po)
alias gpo="git push -u origin"

# checkout (co)
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcop='git checkout -p' #hunkごと

# cherry-pick,revert (cp,rv)
alias gcp='git cherry-pick --ff'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcps='git cherry-pick --skip'
alias grv='git revert'
alias grva='git revert --abort'
alias grvc='git revert --continue'

# add,commit (ad,cm)
alias gad='git add'
alias gadp='git add -p' #hunkごと
alias gcm='git commit -v'
alias gcmm='git commit -m'

# reset (rs)
alias grs='git reset'
alias grsp='git reset -p' #hunkごと
alias grsh='git reset --hard'
alias grss='git reset --soft'

# status (s)
alias gs='git status -sb'

# diff (d)
alias gd='git diff'
alias gdn='git diff --name-status'
alias gds='git diff --staged'

# log (l)
alias gl='git log --stat --decorate'
alias glp='git log -p -1 --stat --decorate' #コミットの変更を確認
alias glg='git log --graph --format="%C(yellow)%h%C(reset)%C(auto)%d%C(reset) %an%C(reset) %C(black bold)[%ad]%C(reset)%n %w(80)%s%n"'
alias glga='git log --graph --all --format="%C(yellow)%h%C(reset)%C(auto)%d%C(reset) %an%C(reset) %C(black bold)[%ad]%C(reset)%n %w(80)%s%n"'
alias glgb='git log --graph --all --format="%C(white)%d%C(reset) %C(black bold)[%ad]%C(reset)"'

# stash (st)
alias gst='git stash'
alias gstl='git stash list'
alias gsta='git stash apply --index'
alias gstd='git stash drop'
alias gstp='git stash pop --index'

# skipworktree (sw)
alias gsw='git update-index --skip-worktre'
alias gnsw='git update-index --no-skip-worktre'
alias gswl='git ls-files -v | grep "S "'


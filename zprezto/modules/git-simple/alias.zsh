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

##  たくさんあっても使いこなせないので、自分のよく使うもののみに...

# barnach
alias gb='git branch -a'
alias gbv='git branch -a -vv'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gsb='git show-branch'
alias gsba='git show-branch -a'

# pull,fetch,merge
alias gp='git pull --rebase --prune --tags'
alias gf='git fetch --prune --tags'
alias gr='git rebase'

# push
alias gpo="git push -u origin"

# checkout
alias gco='git checkout'
alias gcob='git checkout -b'

# cherry-pick
alias gcp="git cherry-pick -ff"

# revert
alias grv='git revert'

# add
alias gad='git add'

# commit
alias gcm='git commit -sv'
alias gcmm='git commit -m'

# status
alias gs='git status -sb'

# diff
alias gd='git diff'
alias gdw='git diff --color-words' #単語ごと

# log
alias glg='git log --graph --format="%C(yellow)%h%C(reset)%C(auto)%d%C(reset) %an%C(reset) %C(black bold)[%ad]%C(reset)%n %w(80)%s%n"'
alias glga='git log --graph --all --format="%C(yellow)%h%C(reset)%C(auto)%d%C(reset) %an%C(reset) %C(black bold)[%ad]%C(reset)%n %w(80)%s%n"'
alias glgb='git log --graph --all --format="%C(white)%d%C(reset) %C(black bold)[%ad]%C(reset)"'
alias gl='git log --stat --decorate'
alias glp='git log -p -1 --stat --decorate' #コミットの変更を確認

# skip worktree
alias gsw='git update-index --skip-worktre'
alias gnsw='git update-index --no-skip-worktre'
alias gswl='git ls-files -v | grep "S "'

# tig
alias tigs='tig status'


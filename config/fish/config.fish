# ----------------------------
#  Env
# ----------------------------
# workspace
set -x WORKSPACE $HOME/develop

# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config

# less
set -x LESS -SRXF

# default editor
set -x VISUAL "nvim"
set -x EDITOR "nvim"

# keybase
# refs: https://github.com/keybase/keybase-issues/issues/2798
set -x GPG_TTY (tty)

# zoxide
# @see zoxide --help
if type "zoxide" > /dev/null 2>&1
  set -x _ZO_DATA_DIR $XDG_CONFIG_HOME/zoxide
  set -x _ZO_EXCLUDE_DIRS $HOME:$WORKSPACE/tool/google-cloud-sdk
  zoxide init fish --no-aliases | source
end

# go
if type "go" > /dev/null 2>&1
  set -x GOPATH $WORKSPACE
  set -x PATH $WORKSPACE/bin $PATH
  set -x GO111MODULE on
end

# Rust
if test -d "$HOME/.cargo/bin"
  set -x PATH $HOME/.cargo/bin $PATH
end

# java (sdkman)
#if test -d "$HOME/.sdkman/bin"
#  function sdk
#    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
#  end
#  for ITEM in $HOME/.sdkman/candidates/* ;
#    set -gx PATH $PATH $ITEM/current/bin
#  end
#
#  set -x JAVA_HOME "$HOME/.sdkman/candidates/java/current"
#end

# deno
if type "deno" > /dev/null 2>&1
  set -x PATH $HOME/.deno/bin $PATH
end

# docker
if type "docker" > /dev/null 2>&1
  set -x DOCKER_BUILDKIT 1
end

# nodebrew
if test -d "$HOME/.nodebrew"
  set -x PATH $HOME/.nodebrew/current/bin $PATH
end

# brew
if test -f "/opt/homebrew/bin/brew"
  eval (/opt/homebrew/bin/brew shellenv)
end

# Google Cloud SDK
if test -d "$WORKSPACE/tool/google-cloud-sdk"
  set -x PATH $WORKSPACE/tool/google-cloud-sdk/bin $PATH
  . "$WORKSPACE/tool/google-cloud-sdk/path.fish.inc"
end

# Rancher Desktop
if test -d "$HOME/.rd/bin"
  set -x PATH "$HOME/.rd/bin" $PATH
end

# rbenv
if test -d "$HOME/.rbenv/shims"
  set -x PATH $HOME/.rbenv/shims $PATH
  status --is-interactive; and rbenv init - fish | source
end


# ログインメッセージを表示しない
set fish_greeting


# ----------------------------
#  Aliases
# ----------------------------
abbr -a o  'open'
abbr -a x  'exit'
abbr -a c  'clear'
abbr -a rm 'rm -rf'

# nvim
if type "nvim" > /dev/null 2>&1
  abbr -a vi 'nvim'
end

# tmux
if type "tmux" > /dev/null 2>&1
  abbr -a t  'tmux attach; or tmux'
end

# Browser Brave > Chrome > Ssfari
if test -d "/Applications/Brave Browser.app"
  abbr -a b  'open -a "/Applications/Brave Browser.app"'
else if test -d "/Applications/Google Chrome.app"
  abbr -a b  'open -a "/Applications/Google Chrome.app"'
else if test -d "/Applications/Safari.app"
  abbr -a b  'open -a "/Applications/Safari.app"'
end

# exa
if type "exa" > /dev/null 2>&1
  abbr -a ll   'exa -l --git'
  abbr -a la   'exa -al --git'
  abbr -a tree 'exa --tree --git-ignore'
end

# Git
if type "git" > /dev/null 2>&1
  abbr -a g    'git'
  abbr -a gb   'git branch -a'
  abbr -a gbv  'git branch -a -vv'
  abbr -a gbd  'git branch -d'
  abbr -a gbD  'git branch -D'
  abbr -a gbm  'git branch -m'
  abbr -a gp   'git pull --rebase --prune --tags'
  abbr -a gf   'git fetch --prune --tags'
  abbr -a gm   'git merge -v'
  abbr -a gcm  'git commit -v'
  abbr -a gcma 'git commit -v --amend --date (env LANG=en_US.UTF-8 date -R)'
  abbr -a grs  'git restore'
  abbr -a grss 'git restore --staged'
  abbr -a grb  'git rebase'
  abbr -a grv  'git revert'
  abbr -a gs   'git status -sb'
  abbr -a gst  'git stash'
  abbr -a gstl 'git stash list'
  abbr -a gstp 'git stash pop --index'
  # abbr -a gco  'git checkout'
  # abbr -a gcob 'git checkout -b'
  abbr -a gsw  'git switch'
  abbr -a gswc 'git switch -c'
  abbr -a gcp  'git cherry-pick --ff'
  abbr -a gad  'git add -v'
  abbr -a gada 'git add -v -A'
  abbr -a gpo  'git push -u origin'
  abbr -a gpfo 'git push --force-with-lease -u origin'
  abbr -a gd   'git diff'
  abbr -a gdc  'git diff --cached'
  abbr -a gll  'git log --no-merges --date=short --pretty="format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s"'
  abbr -a glp  'git log -p -1 --stat --decorate'
  abbr -a glg  'git log --graph --date=short --format="%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n"'
  abbr -a gt   'cd $(git rev-parse --show-toplevel)'
end

# GitHub
if type "gh" > /dev/null 2>&1
  abbr -a repo 'gh repo view --web'
  abbr -a pr   'gh pr view --web || gh pr create --web'
  abbr -a prc  'gh pr checkout'
end

# Docker
if type "docker" > /dev/null 2>&1
  abbr -a d  'docker'
  abbr -a dr 'docker run --rm -it -v $PWD:/workspace'
  abbr -a dc 'docker compose'
end

# K8s
if type "kubectl" > /dev/null 2>&1
  abbr -a kb 'kubectl'
end

# gcloud
if type "gcloud" > /dev/null 2>&1
  abbr -a gcal 'gcloud auth login'
end

# ripgrep
if type "rg" > /dev/null 2>&1
  abbr -a rg 'rg -uu' # 不可視ファイルを無視しない
end


# ----------------------------
#  Key Binds
# ----------------------------
bind \cr '__fzf_history'
bind \cb '__fzf_git_branch -a'
bind \cl '__fzf_git_log'
bind \cs '__fzf_git_status'
bind \cd '__fzf_directory -z'
bind \co '__fzf_docker_images -i'
bind \cf '__fzf_file -f'
bind \cp '__fzf_pr'


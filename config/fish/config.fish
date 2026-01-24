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

# add PATH
fish_add_path $WORKSPACE/bin
fish_add_path $HOME/.cargo/bin            # Rust
fish_add_path $HOME/go/bin                # Golang
fish_add_path $HOME/.nodebrew/current/bin # nodebrew
fish_add_path /opt/homebrew/bin           # homebrew (for mac)
fish_add_path $HOME/.moon/bin             # moonbit

# go
#if type "go" > /dev/null 2>&1
#  set -x GOPATH $WORKSPACE
#end

# Google Cloud SDK
if test -d "$WORKSPACE/tool/google-cloud-sdk"
  fish_add_path $WORKSPACE/tool/google-cloud-sdk/bin
  . "$WORKSPACE/tool/google-cloud-sdk/path.fish.inc"
end

# zoxide
# @see zoxide --help
if type "zoxide" > /dev/null 2>&1
  set -x _ZO_DATA_DIR $XDG_CONFIG_HOME/zoxide
  set -x _ZO_EXCLUDE_DIRS $HOME:$WORKSPACE/tool/google-cloud-sdk
  zoxide init fish --no-aliases | source
end

# ログインメッセージを表示しない
set fish_greeting


# ----------------------------
#  Aliases
# ----------------------------
abbr -a o  'open'
abbr -a x  'exit'
abbr -a rm 'rm -rf'
abbr -a pc 'echo "# " > (git rev-parse --show-toplevel 2>/dev/null)/plan.md'

# nvim
if type "nvim" > /dev/null 2>&1
  abbr -a vi 'nvim'
end

# tmux
if type "tmux" > /dev/null 2>&1
  abbr -a t  'tmux attach; or tmux'
end

# eza
if type "eza" > /dev/null 2>&1
  abbr -a ll   'eza -l --git'
  abbr -a la   'eza -al --git'
  abbr -a tree 'eza --tree --git-ignore'
end

# Git
if type "git" > /dev/null 2>&1
  abbr -a g    'git'
  abbr -a gb   'git branch -a'
  abbr -a gbv  'git branch -a -vv'
  abbr -a gbd  'git branch -D'
  abbr -a gbda 'git branch -vv | grep \': gone]\' | awk \'{print $1}\' | xargs git branch -D' # remote にないブランチを削除
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
  abbr -a gco  'git checkout'
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
  # 現在いるレポジトリのリモートの github actions のキャッシュを全削除
  abbr -a gh-delete-cache 'gh cache list --json id --jq .[].id | xargs -I@ -t gh cache delete @'
end

# Docker
if type "docker" > /dev/null 2>&1
  abbr -a d  'docker'
  abbr -a dr 'docker run --rm -it -v $PWD:/app'
  abbr -a dc 'docker compose'
end

# K8s
if type "kubectl" > /dev/null 2>&1
  abbr -a kb 'kubectl'
end

# gcloud
if type "gcloud" > /dev/null 2>&1
  abbr -a gc   'gcloud'
  abbr -a gcal 'gcloud auth login --update-adc'
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
bind \cf '__fzf_file -f'
bind \cw '__fzf_workspace -p'


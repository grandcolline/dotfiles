# ----------------------------
#  Env
# ----------------------------
# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config

# less
set -x LESS -SRXF

# keybase
# refs: https://github.com/keybase/keybase-issues/issues/2798
set -x GPG_TTY (tty)

# go
if type "go" > /dev/null 2>&1
	set -x GOPATH $HOME/develop
	set -x PATH $HOME/develop/bin $PATH
	set -x GO111MODULE on
end

# Rust
if test -d "$HOME/.cargo/bin"
	set -x PATH $HOME/.cargo/bin $PATH
end

# java
if type "java" > /dev/null 2>&1
	set -x JAVA_HOME (/usr/libexec/java_home)
end

# docker
if type "docker" > /dev/null 2>&1
	set -x DOCKER_BUILDKIT 1
end

# brew
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Google Cloud SDK
if test -f "$HOME/develop/tool/google-cloud-sdk/path.fish.inc"
	. "$HOME/develop/tool/google-cloud-sdk/path.fish.inc"
end


# ----------------------------
#  Aliases
# ----------------------------
abbr -a vi 'nvim'
abbr -a o  'open -R'
abbr -a b  'open -a Vivaldi'
abbr -a t  'tmux attach; or tmux'
abbr -a x  'exit'
abbr -a c  'clear'
abbr -a rm 'rm -rf'

# Git
abbr -a g    'git'
abbr -a gb   'git branch -a'
abbr -a gbv  'git branch -a -vv'
abbr -a gbd  'git branch -d'
abbr -a gp   'git pull --rebase --prune --tags'
abbr -a gf   'git fetch --prune --tags'
abbr -a gm   'git merge -v'
abbr -a gcm  'git commit -v'
abbr -a gcma 'git commit -v --amend --date (env LANG=en_US.UTF-8 date -R)'
abbr -a grs  'git reset'
abbr -a grb  'git rebase'
abbr -a grv  'git revert'
abbr -a gs   'git status -sb'
abbr -a gco  'git checkout'
abbr -a gcob 'git checkout -b'
abbr -a gsw  'git switch'
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

# Docker
abbr -a d  'docker'
abbr -a dr 'docker run --rm -it -v $PWD:/workspace'
abbr -a dc 'docker-compose'

# K8s
abbr -a kb 'kubectl'


# ----------------------------
#  Key Binds
# ----------------------------
bind \cr '__fzf_history'
bind \cb '__fzf_git_branch -a'
bind \cl '__fzf_git_log -a'
bind \cs '__fzf_git_status'
bind \cd '__fzf_directory -f'
bind \co '__fzf_docker_images -i'
bind \cf '__fzf_file -g'

function my_pwd_changed --on-variable PWD
	command fasd --proc (command fasd --sanitize "$PWD") > "/dev/null" 2>&1
end


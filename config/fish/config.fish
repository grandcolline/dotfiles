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
	set -x GOPATH /develop
	set -x PATH /develop/bin $PATH
	set -x GO111MODULE on
end

# java
if type "java" > /dev/null 2>&1
	set -x JAVA_HOME (/usr/libexec/java_home)
end

# docker
if type "docker" > /dev/null 2>&1
	set -x DOCKER_BUILDKIT 1
end

# k8s
if type "kubectl" > /dev/null 2>&1
	set -x KUBECONFIG $HOME/.kube/config:$KUBECONFIG
end


# ----------------------------
#  Aliases
# ----------------------------
alias vi 'nvim'
alias g 'git'
alias o 'open -R'
alias b 'open -a Vivaldi'
alias c 'clear'
alias x 'exit'
alias t 'tmux attach; or tmux'
alias d 'docker'
alias dc 'docker-compose'
alias kb 'kubectl'


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


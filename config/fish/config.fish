# ----------------------------
#  Env
# ----------------------------
# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config

# GO
set -x GOPATH /develop
set -x PATH /develop/bin $PATH
set -x GO111MODULE on

# Java
set -x JAVA_HOME (/usr/libexec/java_home)

# Node
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.npmbrew/current/bin $PATH

# Docker
set -x DOCKER_BUILDKIT 1

# k8s
# 共通設定は、~/.kube/configで。
# 各種クラスターなどの設定は、~/.kube/configs/*で
set -x KUBECONFIG $HOME/.kube/config:$KUBECONFIG
if test -e "$HOME/.kube/configs/*"
	set -x KUBECONFIG $KUBECONFIG:(ls -d $HOME/.kube/configs/* | tr '\n' ':')
end

# less
set -x LESS -SRXF


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
alias me 'nvim && exit'

# gitのaliasだとdateがとれないのでここで
alias gcma 'git commit -v --amend --date=(env LANG=en_US.UTF-8 date "+%a,%d %b %Y %T")'


# ----------------------------
#  Key Binds
# ----------------------------
bind \cr '__fzf_history'
bind \cb '__fzf_git_branch -a'
bind \cl '__fzf_git_log -a'
bind \cs '__fzf_git_status'
bind \cd '__fzf_directory -f'
#bind \cd\cd '__fzf_docker_container -a -i'
bind \co '__fzf_docker_images -i'
bind \cf '__fzf_file -g'

function my_pwd_changed --on-variable PWD
	command fasd --proc (command fasd --sanitize "$PWD") > "/dev/null" 2>&1
end


# ----------------------------
#  Include
# ----------------------------
if test -e $XDG_CONFIG_HOME/fish/config.local.fish
	source $XDG_CONFIG_HOME/fish/config.local.fish
end


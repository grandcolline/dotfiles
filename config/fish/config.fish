# --------------
#  env
# --------------
# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config
# Java
set -x JAVA_HOME (/usr/libexec/java_home)
# Node
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.npmbrew/current/bin $PATH
# Ruby
rbenv init - | source
# GO
set -x GOPATH /develop
set -x PATH /develop/bin $PATH
# For Docker BuildKit
set -x DOCKER_BUILDKIT 1


# ---------------
#  aliases
# ---------------
alias vi 'nvim'
alias g 'git'
alias o 'open -R'
alias c 'clear'
alias t 'tmux'

# gitのaliasだとdateがとれないのでここで
alias gcma 'git commit -v --amend --date=(date)'


# ---------------
#  key binds
# ---------------
function fish_user_key_bindings
	bind \cr '__fzf_history'
	bind \cb '__fzf_git_branch -a'
	bind \cl '__fzf_git_log'
	bind \cl\cl '__fzf_git_log -a'
	bind \cs '__fzf_git_status'
	bind \cd '__fzf_directory -f'
	bind \cd\cd '__fzf_docker_container -a'
	bind \co '__fzf_docker_images'
	bind \cf '__fzf_file -g'
end

function my_pwd_changed --on-variable PWD
	command fasd --proc (command fasd --sanitize "$PWD") > "/dev/null" 2>&1
end

# ---------------
#  Include
# ---------------
if test -e $XDG_CONFIG_HOME/fish/config.local.fish
	source $XDG_CONFIG_HOME/fish/config.local.fish
end

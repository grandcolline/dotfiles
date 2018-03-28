# --------------
#  path
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
#function gvm
#  bass source ~/.gvm/scripts/gvm ';' gvm $argv
#end


# ---------------
#  aliases
# ---------------
alias vi 'nvim'
alias g 'git'
alias o 'open'
alias c 'clear'
alias n 'cd $HOME/Documents/note/ ;and nvim (date +%Y%m%d) ;and cd -'


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

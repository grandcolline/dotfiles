# --------------
#  env
# --------------
# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config


# ---------------
#  aliases
# ---------------
alias vi 'nvim'
alias g 'git'
alias o 'open -R'
alias b 'open -a Vivaldi'
alias c 'clear'
alias x 'exit'
alias t 'tmux'
alias d 'docker'
alias dc 'docker-compose'

# gitのaliasだとdateがとれないのでここで
alias gcma 'git commit -v --amend --date=(env LANG=en_US.UTF-8 date "+%a,%d %b %Y %T")'

# Cheatsheet
alias vcheat 'b $XDG_CONFIG_HOME/cheatsheets/vim.md'
alias fcheat 'b $XDG_CONFIG_HOME/cheatsheets/fish.md'


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


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
#  alias
# ---------------
alias vi 'nvim'
alias g 'git'
alias o 'open'
alias t 'tmux'
alias j 'fzf_fasd_cd'
alias gj 'fzf_ghq_cd'

# remove .DS_Store
alias rmds 'find . -name ".DS_Store" -type f -delete'


# ---------------
#  key bind
# ---------------
function fish_user_key_bindings
  bind \cr '__fzf_history'
  bind \cb '__fzf_git_branch'
  bind \cb\cb '__fzf_git_branch -a'
  bind \cv '__fzf_git_commit'
  bind \cv\cv '__fzf_git_commit -a'
  bind \cx '__fzf_git_status'
  bind \cd '__fzf_directory -f'
  bind \cd\cd '__fzf_directory'
  bind \cf '__fzf_file'
  bind \cf\cf '__fzf_file -g'
end

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
alias rmds 'find . -name ".DS_Store" -type f -ls -delete'

function fish_user_key_bindings
  bind \cr '__fzf_history'
  bind \cb '__fzf_branch'
  bind \cv '__fzf_commit'
  bind \cx '__fzf_git_status'
end

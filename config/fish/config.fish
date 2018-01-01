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
function gvm
  bass source ~/.gvm/scripts/gvm ';' gvm $argv
end


# ---------------
# tmux
# ---------------
if begin; test (which tmux); and test -z $TMUX; end
  tmux -2 attach; or tmux -2 new-session; exit
end


# ---------------
#  alias
# ---------------
alias vi 'nvim'
alias gi 'git'
alias o 'open'

# move trash
alias mt 'rmtrash'

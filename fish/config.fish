# ----------------
#  PATH設定
# ----------------
# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config

# 
set -x DOTFILE_PATH /develop/src/github.com/grandcolline/dotfiles

# Java
set -x JAVA_HOME (/usr/libexec/java_home)

# Node & nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.npmbrew/current/bin $PATH

# Ruby & rbenv
rbenv init - | source

# GO & gvm
set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH /develop
#set -x PATH $PATH $GOPATH/bin
function gvm
  bass source ~/.gvm/scripts/gvm ';' gvm $argv
end


# ----------------
#  alias設定
# ----------------
# neoVim
alias vi 'nvim'

# move trash
alias mt 'rmtrash'

# open Finder
alias o 'open'

# git
. $DOTFILE_PATH/fish/git_aliases.fish

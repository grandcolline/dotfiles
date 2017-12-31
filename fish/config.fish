# ----------------
#  PATH設定
# ----------------
# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config

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
alias vi='nvim'
alias mt='rmtrash'


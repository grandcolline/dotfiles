if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ $UID -eq 0 ]; then
  PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\n\$ "
else
  PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\n\$ "
fi

XDG_CONFIG_HOME=$HOME/.config

alias ls='ls -FG'
alias ll='ls -lFG'
alias la='ls -alFG'

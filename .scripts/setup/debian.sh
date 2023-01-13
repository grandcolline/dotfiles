#!/usr/bin/env bash
set -Eeu -o pipefail

# MIT License Copyright (c) 2021 ginokent https://github.com/rec-logger/rec.sh {{{
_recCmd() { for a in "$@"; do if echo "${a:-}" | grep -Eq "[[:blank:]]"; then printf "'%s' " "${a:-}"; else printf "%s " "${a:-}"; fi; done | sed "s/ $//"; }
RecDebug() { test " ${REC_SEVERITY:-0}" -gt 100 2>/dev/null || echo "$*" | awk "{print \"\\033[0;34m==>\\033[0m \"\$0\"\"}" 1>&2; }
RecInfo()  { test " ${REC_SEVERITY:-0}" -gt 200 2>/dev/null || echo "$*" | awk "{print \"\\033[0;32m==>\\033[0m \"\$0\"\"}" 1>&2; }
RecWarn()  { test " ${REC_SEVERITY:-0}" -gt 300 2>/dev/null || echo "$*" | awk "{print \"\\033[0;33m==>\\033[0m \"\$0\"\"}" 1>&2; }
RecError() { test " ${REC_SEVERITY:-0}" -gt 400 2>/dev/null || echo "$*" | awk "{print \"\\033[0;31m==>\\033[0m \"\$0\"\"}" 1>&2; }
RecExec()  { RecDebug "$ $(_recCmd "$@")" && "$@"; }
# }}}

function Install () {
  RecInfo "install ${1}"
  RecExec sudo apt install -y ${1}
  echo ""
}

RecExec sudo apt -y update

Install gcc # for use neovim plguin
Install git
Install fish
Install zoxide
Install fzf
Install ripgrep
Install fd-find
Install expect
# Install jq

RecInfo "install neovim"
RecExec curl -LsS https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb -o nvim-linux64.deb
RecExec sudo apt install ./nvim-linux64.deb
RecExec rm ./nvim-linux64.deb
echo ""

RecInfo "mkdir WORKSPACE"
RecExec mkdir -p ~/develop/src/github.com/grandcolline
RecExec mkdir -p ~/develop/bin
RecExec mkdir -p ~/develop/pkg
RecExec mkdir -p ~/develop/tool
echo ""

RecInfo "clone dotfiles"
RecExec [ -d ~/develop/src/github.com/grandcolline/dotfiles ] || git clone https://github.com/grandcolline/dotfiles.git ~/develop/src/github.com/grandcolline/dotfiles
echo ""

RecInfo "🍻 DONE!"

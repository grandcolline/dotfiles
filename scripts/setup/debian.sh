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

Install software-properties-common # add-apt-repository を使えるように
Install gcc # for use neovim plguin
Install git
Install zoxide
Install fzf
Install ripgrep
Install fd-find
Install expect
# Install jq

# Get LATEST version fish. refs: https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A3&package=fish
RecInfo "install fish"
RecExec echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
RecExec curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
RecExec sudo apt -y update
RecExec sudo apt install -y fish
echo ""

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

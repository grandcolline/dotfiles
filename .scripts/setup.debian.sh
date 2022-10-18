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

RecInfo "apt update"
RecExec sudo apt -y update
echo ""

RecInfo "install git"
RecExec sudo apt install -y git
echo ""

RecInfo "install neovim"
RecExec curl -LsS https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb -o nvim-linux64.deb
RecExec sudo apt install ./nvim-linux64.deb
RecExec rm ./nvim-linux64.deb
RecInfo "install packer.nvim"
RecExec git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
echo ""

RecInfo "install fish"
RecExec sudo apt install -y fish
echo ""

RecInfo "install zoxide"
RecExec sudo apt install -y zoxide
echo ""

RecInfo "install fzf"
RecExec sudo apt install -y fzf
echo ""

RecInfo "install ripgrep"
RecExec sudo apt install -y ripgrep
echo ""

RecInfo "install fd"
RecExec sudo apt install -y fd-find
echo ""

RecInfo "install expect"
RecExec sudo apt install -y expect
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

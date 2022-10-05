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

dir_path=`pwd`

RecInfo "setup git setting"
RecExec  ln -vsfn $dir_path/config/git $XDG_CONFIG_HOME/git
echo ""

RecInfo "setup FishShell setting"
RecExec ln -vsfn $dir_path/config/fish $XDG_CONFIG_HOME/fish
RecExec curl -LsS https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish \
          -o $dir_path/config/fish/completions/docker.fish
RecExec curl -LsS https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish \
          -o $dir_path/config/fish/completions/docker-compose.fish
RecExec curl -LsS https://raw.githubusercontent.com/evanlucas/fish-kubectl-completions/master/completions/kubectl.fish \
          -o $dir_path/config/fish/completions/kubectl.fish
RecExec curl -LsS https://raw.githubusercontent.com/aliz-ai/google-cloud-sdk-fish-completion/master/completions/gcloud.fish \
          -o $dir_path/config/fish/completions/gcloud.fish
RecExec curl -LsS https://raw.githubusercontent.com/aliz-ai/google-cloud-sdk-fish-completion/master/completions/gsutil.fish \
          -o $dir_path/config/fish/completions/gsutil.fish
RecExec curl -LsS https://raw.githubusercontent.com/aliz-ai/google-cloud-sdk-fish-completion/master/functions/gcloud_sdk_argcomplete.fish \
          -o $dir_path/config/fish/functions/gcloud_sdk_argcomplete.fish
echo ""

RecInfo "setup tmux setting"
RecExec ln -vsf $dir_path/tmux.conf $HOME/.tmux.conf
echo ""

RecInfo "setup neovim setting"
RecExec ln -vsfn $dir_path/config/nvim $XDG_CONFIG_HOME/nvim
echo ""

RecInfo "setup weztermw setting"
RecExec ln -vsfn $dir_path/config/wezterm $XDG_CONFIG_HOME/wezterm
echo ""

RecInfo "setup vim setting"
RecExec ln -vsfn $dir_path/vimrc $HOME/.vimrc
echo ""

RecInfo "setup idea setting"
RecExec ln -vsfn $dir_path/ideavimrc $HOME/.ideavimrc
echo ""

RecInfo "setup mycli setting"
RecExec ln -vsfn $dir_path/myclirc $HOME/.myclirc
echo ""

RecInfo "setup bash setting"
RecExec ln -vsfn $dir_path/bashrc $HOME/.bashrc
echo ""

RecInfo "🍻 DONE!"

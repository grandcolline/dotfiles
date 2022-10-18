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

# See: https://docs.docker.com/engine/install/debian/#install-using-the-repository
#

RecInfo "1. Set up the repository"
RecExec sudo apt-get update
RecExec sudo apt-get install -y ca-certificates curl gnupg lsb-release
RecExec sudo mkdir -p /etc/apt/keyrings
RecExec curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gnupg
RecExec echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo ""

RecInfo "2. Install Docker Engine"
RecExec sudo apt-get update
RecExec sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo ""

RecInfo "🍻 DONE!"

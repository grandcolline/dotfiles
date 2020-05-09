#!/bin/sh

dir_path=`pwd`

echo "===== Git setting ====="
ln -vsfn $dir_path/config/git $XDG_CONFIG_HOME/git
echo ""

echo "===== FishShell setting ====="
ln -vsfn $dir_path/config/fish $XDG_CONFIG_HOME/fish
echo "install completion"
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish \
	-o $dir_path/config/fish/completions/docker.fish
curl https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish \
	-o $dir_path/config/fish/completions/docker-compose.fish
curl https://raw.githubusercontent.com/evanlucas/fish-kubectl-completions/master/completions/kubectl.fish \
	-o $dir_path/config/fish/completions/kubectl.fish
curl https://raw.githubusercontent.com/aliz-ai/google-cloud-sdk-fish-completion/master/completions/gcloud.fish \
	-o $dir_path/config/fish/completions/gcloud.fish
curl https://raw.githubusercontent.com/aliz-ai/google-cloud-sdk-fish-completion/master/completions/gsutil.fish \
	-o $dir_path/config/fish/completions/gsutil.fish
curl https://raw.githubusercontent.com/aliz-ai/google-cloud-sdk-fish-completion/master/functions/gcloud_sdk_argcomplete.fish \
	-o $dir_path/config/fish/functions/gcloud_sdk_argcomplete.fish

echo "===== tmux setting ====="
ln -vsf $dir_path/tmux.conf $HOME/.tmux.conf
echo ""

echo "===== NeoVim setting ====="
ln -vsfn $dir_path/config/nvim $XDG_CONFIG_HOME/nvim
echo ""

echo "===== Vim setting ====="
ln -vsfn $dir_path/vimrc $HOME/.vimrc
echo ""

echo "===== mycli setting ====="
ln -vsfn $dir_path/myclirc $HOME/.myclirc
echo ""

echo "===== bash setting ====="
ln -vsfn $dir_path/bashrc $HOME/.bashrc
echo ""

#!/bin/sh

dir_path=`pwd`

echo "===== Git setting ====="
ln -vsfn $dir_path/config/git $XDG_CONFIG_HOME/git
echo ""

echo "===== FishShell setting ====="
ln -vsfn $dir_path/config/fish $XDG_CONFIG_HOME/fish
echo ""

echo "===== tmux setting ====="
ln -vsf $dir_path/tmux.conf $HOME/.tmux.conf
echo ""

echo "===== NeoVim setting ====="
ln -vsfn $dir_path/config/nvim $XDG_CONFIG_HOME/nvim
echo ""

echo "===== Vim setting ====="
ln -vsfn $dir_path/vimrc $HOME/.vimrc
echo ""

echo "===== ctags setting ====="
ln -vsfn $dir_path/ctags $HOME/.ctags
echo ""

echo "===== mycli setting ====="
ln -vsfn $dir_path/myclirc $HOME/.myclirc
echo ""

#!/bin/sh

# set
dir_path=`pwd`

# git
echo "===== Git setting ====="
ln -vsfn $dir_path/config/git $XDG_CONFIG_HOME/git
echo ""

# fish
echo "===== FishShell setting ====="
ln -vsfn $dir_path/config/fish $XDG_CONFIG_HOME/fish
echo ""

# tmux
echo "===== tmux setting ====="
ln -vsf $dir_path/tmux.conf $HOME/.tmux.conf
echo ""

# ctag
echo "===== Ctag setting ====="
ln -vsf $dir_path/ctags $HOME/.ctags
echo ""

# nvim
echo "===== NeoVim setting ====="
ln -vsfn $dir_path/config/nvim $XDG_CONFIG_HOME/nvim
echo ""

# vim
echo "===== Vim setting ====="
ln -vsfn $dir_path/vimrc $HOME/.vimrc
echo ""

# cheat sheets
echo "===== CheatSheet setting ====="
ln -vsfn $dir_path/config/cheatsheets $XDG_CONFIG_HOME/cheatsheets
echo ""


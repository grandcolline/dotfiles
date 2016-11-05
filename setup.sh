#!/bin/zsh

# $HOMEからリンクを貼る
DOT_FILES=(gitconfig vimrc)
for file in ${DOT_FILES[@]}
do
	ln -s -f $HOME/.dotfiles/$file $HOME/.$file
done

z_DOT_FILES=(zlogin zlogout zpreztorc zshenv zshrc zprofile)
for zfile in ${z_DOT_FILES[@]}
do
	ln -s -f $HOME/.dotfiles/zprezto/runcoms/$zfile $HOME/.$zfile
done

ln -s -f $HOME/.dotfiles/vim $HOME/.vim

# PCごとに管理するファイルの作成
cp $HOME/.dotfiles/zshrc.local.defalt $HOME/.dotfiles/zshrc.local
cp $HOME/.dotfiles/gitconfig.local.defalt $HOME/.dotfiles/gitconfig.local

# 必要なものをbrew install
brew update
brew install peco
brew install tree
brew install tig



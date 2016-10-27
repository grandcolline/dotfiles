#!/bin/zsh

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

brew update
brew install peco
brew install tree
brew install tig



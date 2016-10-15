#!/bin/zsh


DOT_FILES=(gitconfig gitignore_global vimrc)
for file in ${DOT_FILES[@]}
do
	ln -s -f $HOME/.dotfiles/$file $HOME/.$file
done


# zprezto
for rcfile in $HOME/.dotfiles/zprezto/runcoms/^README.md(.N); do
	ln -s -f $rcfile $HOME/.${rcfile:t}
done
